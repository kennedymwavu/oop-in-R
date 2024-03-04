box::use(
  R6[R6Class]
)

Dog <- R6Class(
  classname = "Dog",
  public = list(
    initialize = \(name, age) {
      self$name <- name
      self$age <- age
      invisible(self)
    },
    name = NULL,
    age = NULL,
    bark = \() {
      print("bark")
      invisible(self)
    },
    get_age = \() self$age,
    set_age = \(age) {
      self$age <- age
      invisible(self)
    }
  )
)

alex <- Dog$new("alex", 34)
alex$name
alex$get_age()
alex$set_age(40)$get_age()
