---
title: "cows table"
description: "The primary table for cow-related identification. This table should tie to any information about cows, their locations, movement, treatments and, ultimately,..."
---

# cows
Description:

**The primary table for cow-related identification. This table should tie to any information about cows, their locations, movement, treatments and, ultimately, datasets produced using the cows as primary data elements.**

## Columns

|     name     |    type   |                                                                                                                                                              comment                                                                                                                                                              |
|--------------|-----------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|    *cadid*   |    text   |                                                                                                               This is the unique identifier given to the cow by the Canadian Government that conforms to ISO 11784.                                                                                                               |
| *cowschemeid*|    text   |                                                           We clearly identify the scheme from which the cow ID is coming from. It is implied  that this is the Canadian data scheme, but if this data is used in synthesis work  it is important to identify the source.                                                          |
| *localcowid* |  integer  |                                                                     Within the UBC dairy the cows are given ear tags with the numbering scheme YNNN where Y is the last number of the year (6 for 2026) and NNN is the birth order of the cow in a given year.                                                                    |
|     *sex*    |  nchar(1) |                                                                                                      We record both male and female births in this database. Values are an enum (male/female) that should correspond to PATO.                                                                                                     |
| *birthweight*|  integer  |                                                                           The weight of the cow at birth in kg. This should likely be moved to its own `weights` table, where the weight at birth is the weight that is closest to a cow's birth weight.                                                                          |
|    *damid*   |    text   |                                                                                                                     The cadid identifier for the dam. Should generally be constrained to be a valid identifer.                                                                                                                    |
|   *sireid*   |   uuid7   |                                                                                                                                             A unique identifier for a particular sire.                                                                                                                                            |
| *datecreated*|timestamptz|                                 The date this entry was created. This field is used for the purposes of tracking changes across the database, and supporting reproducibility of data and data models, by allowing users to "roll back" or search for the impacts of new changes or data additions.                                |
|*datemodified*|  datetime |The date of the most recent record modification. This column does not identify how the record was changed, although this should be a central element of the data model. At present we are implementing the toolset, and providing the opportunity to see that a record was modified, not neccessarily how that record was modified.|

## Constraints

|    name   |           type           |                   ddl                  |       reference       |                                                                 comment                                                                 |
|-----------|--------------------------|----------------------------------------|-----------------------|-----------------------------------------------------------------------------------------------------------------------------------------|
|cowuniqueid|ConstraintType.primary_key|    PRIMARY KEY (cadid, cowschemeid)    |                       | The PRIMARY KEY for this table is the unique set of the Canadian ID and the scheme type. In our case all of the identifiers should have |
|  isocadid |   ConstraintType.check   |CHECK (cadid ~* '^124000[0-2][0-9]{8}$')|                       |The cadid must follow the ISO 11784 standard, with '124' leading for Canada and the trailing numbers ranging from 000000001 to 299999999.|
| damidvalid|ConstraintType.foreign_key|                                        |[cows](cows.md) (cadid)|                     A constraint to ensure that the dam ID is a valid ID based on the Canadian government ID scheme.                    |

## Indexes

This table has no index

## Relationships

**References**

* `damid` → [cows](cows.md) (`cadid`)

**Referenced By**

* [cows](cows.md) (`damid`) → `cadid`
