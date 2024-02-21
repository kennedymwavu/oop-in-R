box::use(
  R6[R6Class]
)

# Let's explore how to create R6 classes.

Accumulator <- R6Class(
  classname = "Accumulator",
  public = list(
    # example of a public field:
    sum = 0,
    # example of a public method:
    add = \(x = 1) {
      self$sum <- self$sum + x
      invisible(self)
    }
  )
)

Accumulator

# construct a new object from the class:
x <- Accumulator$new()
x

x$sum

x$add(10)
x$sum

# since side-effect methods return 'self', you can chain them:
x$
  add(20)$
  add(30)$
  sum
