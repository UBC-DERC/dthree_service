# Testing

Testing is really important! It helps make sure things are happening as you would expect them to. In R the package [`testthat`](https://testthat.r-lib.org/) is really useful for setting up tests, in Python, using [`pytest`](https://docs.pytest.org/en/stable/) is really helpful.

## Good Tests

A good test should test one thing, and test it well. Tests are things that can run quickly (generally) as a check to make sure your code works the way you expect it to.

They're really important, because if you start writing complicated stuff, you want to make sure that your figures, tables and statistical tests are actually showing what you expect them to show.


For example, if you are loading data from a CSV file and turning it into a data.frame in R, turn it into a function, and write a test for it:

```R
load_data <- function(filename) {
    ...
    # Assume we expect the column names to be 'id', 'size' and 'width'.
    return(whatever)
}
```

Then your test can look like this:

```R
test_load <- function(){
    aa = load_data(filename)
    our_test <- all(c('id', 'size', 'width') %in% colnames(aa))
    assertthat::assert_that(our_test, "The column names we expected aren't there!")
}
```

If this fails, then that tells us that any of our figures, or tests that depend on this table are likely not showing us what we expected.
