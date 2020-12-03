ui <- fluidPage(
  flowLayout(sliderInput("nrow", "number of rows",
                         min = 1, max = 19, value = 19, step = 1),
             plotOutput("plot1"),
             plotOutput("plot2"))
  )
