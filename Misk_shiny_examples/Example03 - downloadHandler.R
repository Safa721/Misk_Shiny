# getwd()
# setwd("./Day2Exercises/examples/")
# list.files()

ui <- fluidPage(
  downloadLink("downloadData", "Download")
)

server <- function(input, output) {
  # Our dataset
  data <- mtcars

  source("./Day2Exercises/examples/setDL.R")

}

shinyApp(ui, server)

