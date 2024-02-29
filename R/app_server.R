#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {
  # Your application server logic
  rctv_data_filtered <- mod_filters_server("filters_1")

  mod_page1_server("page1_1", data = rctv_data_filtered)

  output$table_orders <- reactable::renderReactable({
    rctv_data_filtered() |>
      reactable::reactable(width = "100%")
  })
}
