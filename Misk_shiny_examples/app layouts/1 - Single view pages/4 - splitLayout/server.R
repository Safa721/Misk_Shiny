function(input, output) {
  output$plot1 <- renderPlot({
    ggplot(head(pressure, input$nrow), aes(temperature, pressure)) +
      geom_point() +
      theme_classic()
  })

  output$plot2 <- renderPlot({
    ggplot(head(mtcars, input$nrow), aes(wt, mpg, col = factor(cyl))) +
      geom_point() +
      theme_classic()
  })

}
