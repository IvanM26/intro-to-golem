#' ui
#'
#' @description A utils function
#'
#' @return The return value, if any, from executing the utility.
#'
#' @noRd
get_choices <- function(data, column) {
  data[[column]] |> unique() |> sort()
}
