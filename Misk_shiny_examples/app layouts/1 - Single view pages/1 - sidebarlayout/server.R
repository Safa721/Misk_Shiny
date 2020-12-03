function(input, output) {
  #####
  ##### Reactive components here
  myData <- reactive({
    head(pressure, input$nrow)
  })

  output$plot <- renderPlot({
    ggplot(myData(), aes(temperature, pressure)) +
      geom_point() +
      theme_classic()
    })
}
