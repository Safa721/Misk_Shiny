function(input,output) {

  ################################################################################ Binom Sub-menu
  ################################################################################

  output$value <- renderPrint({input$action})

  output$distPlot <- renderPlot({

    x    <- faithful$waiting
    bins <- seq(min(x), max(x), length.out = input$bins + 1)

    hist(x, breaks = bins, col = "#75AADB", border = "white",
         xlab = "Waiting time to next eruption (in mins)",
         main = "Histogram of waiting times")

  })


  set.seed(122)
  histdata <- rnorm(500)

  output$plotHIST <- renderPlot({
    data <- histdata[seq_len(input$slider)]
    hist(data)
  })



  output$actionbuttonOutput <- renderPrint(input$action)


} # End server
