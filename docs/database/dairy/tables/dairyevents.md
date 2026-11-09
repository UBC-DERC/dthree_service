---
title: "dairyevents table"
description: "The primary table for storing records about an individual dairy event. We are modeling this table after the [schema:Event](https://schema.org/Event) data mod..."
---

# dairyevents
Description:

**The primary table for storing records about an individual dairy event. We are modeling this table after the [schema:Event](https://schema.org/Event) data model to some degree, for broader compatibility.**

## Columns

|    name   | type|                                                                                                                           comment                                                                                                                           |
|-----------|-----|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| *eventid* |UUID7|                                                         The primary key for the dairyevents table. This is a unique identifier for each event, and is used to link to other tables in the database.                                                         |
|*eventtype*| text|The type of event that occurred. This should be a controlled vocabulary, but we don't have one yet. At minimum it should include: birth, insemination, dry off, calving, death, treatment, heat and other events that are recorded in dairycomp or dairyplan.|

## Constraints

This table has no constraints

## Indexes

This table has no index

## Relationships

**References**

None.

**Referenced By**

None.
