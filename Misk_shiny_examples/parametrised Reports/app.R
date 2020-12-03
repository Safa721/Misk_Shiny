
library(ggplot2)
library(shiny)

source("functions.R")

ui <- fluidPage(
  sidebarLayout(
    sidebarPanel(
      selectInput("x", "X axis:", choices = names(mtcars), selected = names(mtcars)[1]),
      selectInput("y", "Y axis:", choices = names(mtcars), selected = names(mtcars)[3]),
      actionButton("makeReport", "Make Report")
    ),
    mainPanel(
      plotOutput("plot")
    )
  )
)

server <- function(input, output) {

  output$plot <- renderPlot({makePlot("mtcars", input$x, input$y)})

  observeEvent(input$makeReport, {
    rmarkdown::render("template.Rmd",
                      params = list(
                        dataframe = "mtcars",
                        x = "mpg",
                        y = "wt"))

  })

}

shinyApp(ui, server)
