


# The DownloadHandler

In the previous examples, we used an `observe()` function to download data. A more typical way is to use the `downloadHandler()` function.

## Data frames

`app.R`

```
ui <- fluidPage(
  downloadLink("downloadData", "Download")
)

server <- function(input, output) {
  # Our dataset
  data <- mtcars

  output$downloadData <- downloadHandler(
    filename = function() {
      paste("data-", Sys.Date(), ".csv", sep="")
    },
    content = function(file) {
      write.csv(data, file)
    }
  )
}

shinyApp(ui, server)
```

## ggplot2 objects

`ui.R`

```
fluidPage(
  sidebarLayout(

    # Sidebar with a slider input
    sidebarPanel(
      sliderInput("nrow", "number of rows",
                  min = 1, max = 19, value = 19, step = 1)

    ),
    mainPanel(
      plotOutput('plot'),
      downloadButton('downloadImage', 'Download Image')
    )
  )
)
```

`server.R`

```
library(ggplot2)

function(input, output) {

  # Generate the plot
  myPlot <- reactive({
    pSmall <- head(pressure, input$nrow)

    ggplot(pSmall, aes(temperature, pressure)) +
      geom_point() +
      theme_classic()
  })

  # Display the plot
  output$plot <- renderPlot({
      myPlot()
    })

  # Download the plot
  output$downloadImage <- downloadHandler(
    filename = function() {
      "plot.pdf"
    },

    content = function(file){
      ggsave(file, myPlot(), height = 16, width = 16, unit = "in")
    },

    contentType = 'image/pdf'
    )
}
```
