box::use(
  R6[R6Class]
)

Pet <- R6Class(
  classname = "Pet",
  public = list(
    name = NULL,
    age = NULL,
    initialize = \(name, age) {
      self$name <- name
      self$age <- age
    },
    show = \() {
      sprintf("I am %s and I am %d years old", self$name, self$age)
    },
    speak = \() print("I don't know what to say!")
  )
)

Cat <- R6Class(
  classname = "Cat",
  inherit = Pet,
  public = list(
    color = NULL,
    initialize = \(name, age, color) {
      super$initialize(name, age)
      self$color <- color
    },
    speak = \() print("Meow"),
    show = \() {
      sprintf(
        "I am %s of color %s. I am %d years old",
        self$name,
        self$color,
        self$age
      )
    }
  )
)

Dog <- R6Class(
  classname = "Dog",
  inherit = Pet,
  public = list(
    speak = \() print("Bark")
  )
)

Fish <- R6Class(
  classname = "Fish",
  inherit = Pet,
  public = list()
)

tim <- Pet$new(name = "Tim", 19)
tim$show()
tim$speak()

peace <- Cat$new(name = "Peace", age = 3, color = "brown")
peace$show()
peace$speak()
peace$color

duke <- Dog$new(name = "Duke", 5)
duke$show()
duke$speak()

bubbles <- Fish$new(name = "Bubbles", 10)
bubbles$show()
bubbles$speak()
