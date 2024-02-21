box::use(
  R6[R6Class]
)

# You can define an 'initialize' method for your class.

Person <- R6Class(
  classname = "Person",
  public = list(
    name = NULL,
    age = NA,
    initialize = \(name, age = NA) {
      stopifnot(is.character(name), length(name) == 1L)
      stopifnot(is.numeric(age), length(age) == 1L)

      self$name <- name
      self$age <- age
    }
  )
)

# this will throw an error:
mwavu <- Person$new(name = "Mwavu", age = "forty")

# this works:
mwavu <- Person$new(name = "Mwavu", age = 40)
mwavu$age
mwavu$name
