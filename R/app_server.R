#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {
  # Your application server logic
  rctv_data_filtered <- shiny::reactive({
    sales_data |>
      dplyr::filter(
        STATE == input$state,
        PRODUCTLINE == input$product_line
      )
  }) |>
    shiny::bindEvent(input$apply)

  output$chart_sales_by_city <- echarts4r::renderEcharts4r({
    create_chart(rctv_data_filtered())
  })

  output$table_orders <- reactable::renderReactable({
    rctv_data_filtered() |>
      reactable::reactable(width = "100%")
  })
}
