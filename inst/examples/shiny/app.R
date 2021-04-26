library(shiny)
library(shinydashboard)
library(dplyr)
library(ggplot2)
library(parcoordsSoS)


body <- dashboardBody(
  box(
    title = "Parcoords Plot Example", width = NULL, status = "primary",
    parcoordsOutput("DiamondPlot")
  ),
  box(
    title = "Extracted Data", width = NULL, status = "primary",
    dataTableOutput("SelectedData")
  )
)

ui <- dashboardPage(
  dashboardHeader(title="Parcoords"),
  dashboardSidebar(disable=TRUE),
  body
)



server = function(input, output, session) {
  ###generate a data set to use
  data( diamonds, package = "ggplot2" )
  ###standard parcoords plot in shiny

  output$DiamondPlot <- renderParcoords({
    parcoords(diamonds[1:30, ],
              rownames= T,
              color = list(colorScale = htmlwidgets::JS('d3.scale.category10()'),
                            colorBy = "carat"),
              selectedRows = rownames(diamonds)[1:5],
              brushMode = "2D-strums", dimensionTitleRotation=-15)
  })

  ###Here we can access the variable input$id_rows to determine which are selected
  ###we display these results in a table
  output$SelectedData <- renderDataTable({
    ids <- rownames(diamonds) %in% input$DiamondPlot_brushed_row_names
    diamonds[ids,]
  })

}

shinyApp(ui, server)
