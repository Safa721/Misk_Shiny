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

