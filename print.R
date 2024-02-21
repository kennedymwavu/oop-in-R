box::use(
  R6[R6Class]
)

# defining $print() allows you to override the default printing behaviour

Person <- R6Class(
  classname = "Person",
  public = list(
    name = NULL,
    age = NA,
    initialize = \(name, age = NA) {
      self$name <- name
      self$age <- age
    },
    print = \(...) {
      cat("Person: \n")
      cat(" Name: ", self$name, "\n", sep = "")
      cat(" Age: ", self$age, "\n", sep = "")
      invisible(self)
    }
  )
)

mwavu <- Person$new(name = "Mwavu")
mwavu

mwavu$age <- 30
mwavu
