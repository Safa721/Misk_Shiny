ui <- fluidPage(
  fluidRow(column(width = 4,
                  plotOutput("plot1")),
           column(width = 2, offset = 3,
                  sliderInput("nrow", "number of rows",
                              min = 1, max = 19, value = 19, step = 1))),
  fluidRow(column(width = 12),
           plotOutput("plot2"))
)
