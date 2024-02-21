box::use(
  R6[R6Class]
)

# adding fields & methods after class creation

Accumulator <- R6Class(classname = "Accumulator")
Accumulator

Accumulator$set(
  which = "public",
  name = "sum",
  value = 0
)

Accumulator

Accumulator$set(
  which = "public",
  name = "add",
  value = \(x = 1) {
    self$sum <- self$sum + x
    invisible(self)
  }
)

Accumulator

x <- Accumulator$new()
x$add()
x$sum

x$sum <- 10
x$sum
