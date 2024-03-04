box::use(
  R6[R6Class]
)

Student <- R6Class(
  classname = "Student",
  public = list(
    name = NULL,
    age = NULL,
    grade = NULL, # 0 - 100
    initialize = \(name, age, grade) {
      self$name <- name
      self$age <- age
      self$grade <- grade
    },
    get_grade = \() self$grade
  )
)

Course <- R6Class(
  classname = "Course",
  public = list(
    name = NULL,
    max_students = NULL,
    students = list(),
    initialize = \(name, max_students) {
      self$name <- name
      self$max_students <- max_students
    },
    add_student = \(student) {
      if (length(self$students) < self$max_students) {
        self$students <- append(self$students, student)
        return(TRUE)
      }
      FALSE
    },
    get_average_grade = \() {
      total <- 0
      for (student in self$students) {
        total <- total + student$get_grade()
      }
      if (total == 0) {
        return(0)
      }
      total / self$max_students
    }
  )
)

alex <- Student$new(name = "Alex", age = 20, grade = 95)
barry <- Student$new(name = "Barry", age = 21, grade = 70)
cate <- Student$new(name = "Cate", age = 19, grade = 65)

course <- Course$new(name = "Science", max_students = 2)
course$add_student(alex)
course$add_student(barry)

course$add_student(cate)

course$get_average_grade()
