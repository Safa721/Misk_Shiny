shinyUI(fluidPage(
  sidebarLayout(
    sidebarPanel(
      ##### UI components here
      sliderInput("nrow", "number of rows",
                  min = 1, max = 19, value = 19, step = 1)

    ),
    mainPanel(
      #####
      ##### Output components here
      plotOutput("plot")

    )
  )
)
)
