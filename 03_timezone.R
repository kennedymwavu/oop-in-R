box::use(
  R6[R6Class]
)

# ------------
#
# Create an R6 class that allows you to get and set the current time zone.
# You can access the current time zone with Sys.timezone() and set it with
# Sys.setenv(TZ = "newtimezone").
# When setting the time zone, make sure the new time zone is in the list
# provided by OlsonNames().
#
# ------------

Timezone <- R6Class(
  classname = "Timezone",
  public = list(
    get_zone = \() {
      Sys.time() |> format("%Z")
    },
    set_zone = \(new_timezone) {
      if (!new_timezone %in% OlsonNames()) {
        stop("Invalid timezone! See `OlsonNames()` for valid values.")
      }
      Sys.setenv(TZ = new_timezone)
      invisible(self)
    }
  )
)

tz <- Timezone$new()
tz$get_zone()
tz$set_zone("Africa/Nairobi")$get_zone()
tz$set_zone("US/Mountain")$get_zone()

# invalid tz:
tz$set_zone("this")
