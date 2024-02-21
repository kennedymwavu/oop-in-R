box::use(
  R6[R6Class]
)

Accumulator <- R6Class(
  classname = "Accumulator",
  public = list(
    sum = 0,
    add = \(x = 1) {
      self$sum <- self$sum + x
      invisible(self)
    }
  )
)

AccumulatorChatty <- R6Class(
  classname = "AccumulatorChatty",
  public = list(
    add = \(x = 1) {
      cat("Adding ", x, "\n", sep = "")
      super$add(x = x)
    }
  ),
  inherit = Accumulator
)

x <- AccumulatorChatty$new()
x$sum
x$add(10)
x$add(10)$add(20)$sum

class(x)
