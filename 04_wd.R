box::use(
  R6[R6Class]
)

# ------------
# 
# Create an R6 class that manages the current working directory. 
# It should have $get() and $set() methods.
#
# ------------

WD <- R6Class(
  classname = "WD",
  public = list(
    get = \() getwd(),
    set = \(path) {
      setwd(path)
      invisible(self)
    }
  )
)

d <- WD$new()
old <- d$get()

d$set("/home/mwavu")$get()
list.files()

d$set(old)$get()
list.files()
