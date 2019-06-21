library(microbenchmark)
library(tibble)
library(data.table)

## choose a sufficiently large n (number of rows) to see the effect
## 1M rows takes ~50 ms on my computer
n <- 1e6
newcol <- sample(LETTERS, n, replace=TRUE)
                           # new column to be added:
                           # a random sample of capital letters A-Z

## data frames
df <- data.frame(a = sample(1:10, n, replace=TRUE), b=sample(letters, n, replace=TRUE))
                           # random sample of number 1:10, and random sample of
                           # letters a-z
dfAddCol <- function() {
   dat <- cbind(df, newcol)
                           # cbind adds a new column
   dat
}
microbenchmark(dfAddCol())
                           # note: microbenchmark runs the code 100 times by default

tib <- tibble(a = sample(1:10, n, replace=TRUE), b=sample(letters, n, replace=TRUE))
tibAddCol <- function() {
   dat <- cbind(tib, newcol)
   dat
}
microbenchmark(tibAddCol())

dt <- data.table(a = sample(1:10, n, replace=TRUE), b=sample(letters, n, replace=TRUE))
dtAddCol <- function() {
   dt[, col := newcol]
   dt
}

microbenchmark(dtAddCol())
microbenchmark(dfAddCol(), tibAddCol(), dtAddCol())
