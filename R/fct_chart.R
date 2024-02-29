#' chart
#'
#' @description A fct function
#'
#' @return The return value, if any, from executing the function.
#'
#' @noRd
create_chart <- function(data) {

  data |>
    dplyr::summarise(TOTAL_SALES = sum(SALES), .by = CITY) |>
    dplyr::arrange(TOTAL_SALES) |>
    echarts4r::e_chart(x = CITY) |>
    echarts4r::e_bar(serie = TOTAL_SALES, name = "Total Sales") |>
    echarts4r::e_flip_coords() |>
    echarts4r::e_tooltip()

}
