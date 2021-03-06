library(shiny)

ui <- fluidPage(
  sidebarLayout(
  sidebarPanel(
    fileInput("file", "Upload file"),
    numericInput("Delete", "Delete row:", 1, step = 1),
    actionButton("Go", "Delete!")
  ),
  mainPanel(
    tableOutput("df_data_out")
    )
  )
  )

server <- function(input, output) {

    values <- reactiveValues(df_data = NULL)

    observeEvent(input$file, {
      values$df_data <- read.csv(input$file$datapath)
    })

    observeEvent(input$Go, {
      temp <- values$df_data[-input$Delete, ]
      values$df_data <- temp
    })

    output$df_data_out <- renderTable(values$df_data)
  }

shinyApp(ui, server)
