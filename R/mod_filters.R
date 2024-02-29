#' filters UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_filters_ui <- function(id){
  ns <- NS(id)
  tagList(

    shiny::selectInput(
      inputId = ns("state"),
      label = "Select State",
      choices = get_choices(sales_data, "STATE")
    ),

    shiny::selectInput(
      inputId = ns("product_line"),
      label = "Select Product Line",
      choices = get_choices(sales_data, "PRODUCTLINE")
    ),

    shiny::actionButton(
      inputId = ns("apply"),
      label = "Apply"
    )

  )
}

#' filters Server Functions
#'
#' @noRd
mod_filters_server <- function(id, rctv_inputs){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

    shiny::observe({
      rctv_inputs$product_line <- input$product_line
      rctv_inputs$state <- input$state
    }) |>
      shiny::bindEvent(input$apply)

    rctv_data_filtered <- shiny::reactive({
      sales_data |>
        dplyr::filter(
          STATE == input$state,
          PRODUCTLINE == input$product_line
        )
    }) |>
      shiny::bindEvent(input$apply)

    return(rctv_data_filtered)

  })
}

## To be copied in the UI
# mod_filters_ui("filters_1")

## To be copied in the server
# mod_filters_server("filters_1")
