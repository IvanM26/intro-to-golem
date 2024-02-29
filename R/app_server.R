#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {
  # Your application server logic
  rctv_data_filtered <- mod_filters_server("filters_1")

  output$chart_sales_by_city <- echarts4r::renderEcharts4r({
    create_chart(rctv_data_filtered())
  })

  output$table_orders <- reactable::renderReactable({
    rctv_data_filtered() |>
      reactable::reactable(width = "100%")
  })
}
