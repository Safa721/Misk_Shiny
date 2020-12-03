# Tab panel
# The first tab contains a sidebarLayout
# The second conatins unformatted UI elements

ui <- fluidPage(
  navbarPage(title = "Start",
             navbarMenu("Data Sets",
                        tabPanel("pressure",
                                 sliderInput("nrow", "number of rows",
                                             min = 1, max = 19, value = 19, step = 1),
                                 plotOutput("plot1")
                        ),
                        tabPanel("mtcars",
                                 selectInput("y", "Y axis", choices = c("mpg", "disp", "hp", "drat", "wt", "qsec")),
                                 selectInput("x", "X axis", choices = c("cyl", "vs", "am", "gear", "carb")),
                                 plotOutput("plot2"))
             )
  )
)
