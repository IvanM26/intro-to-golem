#' page1 UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_page1_ui <- function(id){
  ns <- NS(id)
  tagList(
    bslib::card(
      bslib::card_header(shiny::textOutput(outputId = ns("card_header"))),
      echarts4r::echarts4rOutput(outputId = ns("chart_sales_by_city"))
    )
  )
}

#' page1 Server Functions
#'
#' @noRd
mod_page1_server <- function(id, data, rctv_inputs){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

    output$card_header <- shiny::renderText({
      glue::glue("{ rctv_inputs$product_line } sales by City in { rctv_inputs$state }")
    })

    output$chart_sales_by_city <- echarts4r::renderEcharts4r({
      create_chart(data())
    })

  })
}

## To be copied in the UI
# mod_page1_ui("page1_1")

## To be copied in the server
# mod_page1_server("page1_1")
