function(input, output) {
  output$plot1 <- renderPlot({
    ggplot(head(pressure, input$nrow), aes(temperature, pressure)) +
      geom_point() +
      theme_classic()
  })

  output$plot2 <- renderPlot({
    ggplot(mtcars, aes_string(input$x, input$y)) +
      geom_point() +
      theme_classic() +
      theme(legend.title = element_blank())
  })

}
