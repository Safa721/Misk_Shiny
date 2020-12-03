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
