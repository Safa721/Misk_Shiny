shinyUI(
  navbarPage(theme = shinytheme("yeti"),
             id = 'main',
             title = "Developing Data Products",
             fluidRow(title = 'Start', width=12,  align = "center",
                      tags$body(tags$p(style = "padding: 30px; width:822px",
                                       align = 'left',
                                       "Welcome!",
                                       tags$br(), tags$br(),
                                       'This application is a go-to source for getting you up-and-running with interactive shiny applications in R.',
                                       tags$br(), tags$br(),
                                       'Misk Academy, Data Science Immersive 2020'
                      ))
             ),
             # tabPanel("", ),
             ################################################################################ Distributions Menu
             ################################################################################
             ################################################################################
             ################################################################################
             # navbarMenu("Version Control",
             #            tabPanel("GitHub"),
             #            tabPanel("Command Line GitHub")),
             navbarMenu("Markdown",
                        tabPanel("Basic Syntax",
                                 includeMarkdown("MarkdownBasics.md"),
                                 includeMarkdown("InteractiveDocument.md")),
                        tabPanel("Widgets",
                                 fluidPage(
                                   titlePanel("Widget Examples"),
                                   fluidRow(
                                     column(4,
                                            h3("Action Button"),
                                            # renderPrint("hello"),
                                            actionButton("action", label = "Execute")
                                            # verbatimTextOutput("actionbuttonOutput")
                                            ),
                                     column(4,
                                            h3("Single Checkbox"),
                                            checkboxInput("checkbox", label = "Show points", value = TRUE),
                                            verbatimTextOutput("singlecheckOutput")
                                     ),
                                     column(4,
                                            h3("Checkbox group"),
                                            checkboxGroupInput("checkGroup", label = "Select options", choices = list("Carbs" = 1, "Proteins" = 2, "Fat" = 3), selected = 1),
                                            verbatimTextOutput("checkgroupOutput")
                                     )
                                     ),
                                   fluidRow(
                                     column(4,
                                            h3("Radio buttons"),
                                            radioButtons("radio", label = "Selection options",
                                                         choices = list("Carbs" = 1, "Proteins" = 2, "Fat" = 3),
                                                         selected = 1)
                                     ),
                                     column(4,
                                            h3("Select box"),
                                            selectInput("select", label = "Select options",
                                                        choices = list("Carbs" = 1, "Proteins" = 2, "Fat" = 3),
                                                        selected = 1)
                                     ),
                                     column(4,
                                            h3("Slider"),
                                            sliderInput("slider1", label = "Pick a number", min = 0,
                                                        max = 100, value = 50)
                                     )
                                   ),
                                   fluidRow(
                                     column(4,
                                            h3("Slider range"),
                                            sliderInput("slider2", label = "Pick a number range", min = 0,
                                                        max = 100, value = c(40, 60))
                                     ),
                                     column(4,
                                            h3("Text input"),
                                            textInput("text", label = "ID value:", value = "Enter text...")
                                     ),
                                     column(4,
                                            h3("Date Input"),
                                            dateInput("date", label = "Choose date", value = "2014-01-01")
                                     )
                                   ),
                                   fluidRow(
                                     column(4,
                                            h3("Date Range"),
                                            dateRangeInput("dates", label = "Choose date range")
                                     ),
                                     column(4,
                                            h3("File input"),
                                            fileInput("file", label = "File input")
                                     ),
                                     column(4,
                                            h3("Numeric input"),
                                            numericInput("num", label = "Numeric input", value = 1)
                                     )
                                   )
                                 ),
                                 includeMarkdown("widgetsTable.md")
                                 ),
                        tabPanel("Render output functions",
                                 includeMarkdown("renderTable.md"))
                        # tabPanel("Interactive documents",
                        #          column(1),
                        #          column(5,br(),br(),br(),
                        #                 withMathJax(p("This application allows users to perform either a", code("one-sample t-test",style="color:navy"),
                        #                               "or a", code("two-sample t-test",style="color:navy"),".  A one-sample t-test focuses on comparing the average of a
                        #                               single quantitative variable to a hypothesized value, while a two-sample t-test
                        #                               focuses on comparing the difference in averages of a quantitative variable between two groups to a hypothesized value.  In
                        #                               both scenarios, the purpose of the hypothesis test is to determine how likely are the observed results or any more extreme results,
                        #                               under the assumption that the null hypothesis is true. This is known as a", strong("p-value.")),
                        #                             p("In most data analyses, the population mean(s) along with the population standard deviation(s) are unknown.
                        #                               Therefore, the", strong("t-test"), "is used instead of a z-test.  The", strong("t-statistic"), "can be calculated to determine the p-value,
                        #                               by comparing it to the", strong("t-distribution"), "with a", strong("specified degrees of freedom."), "In this scenario, the sample standard deviation(s) replaces the population standard deviation(s) to yield
                        #                               the", strong("standard error"), "(an estimate of the true standard deviation) of the", strong("sampling distribution.")))),
                        #
                        #          column(5,br(),br(),br(),
                        #
                        #                 wellPanel(
                        #                   # includeMarkdown("InteractiveDocument.md"),
                        #                   # code("inputPanel({
                        #                   #             radioButtons('shape', 'Shape',
                        #                   #      c('Circle, no outline' = 16,
                        #                   #      'Circle, with outline' = 19))
                        #                   #      })")
                        #                   code("code regular", style="color:black"),
                        #
                        #                   code("code, stlye blue", style="color:navy"),
                        #                   p(HTML("<ul>
                        #                          <li type=square> the parameter of interest is the population mean, &mu;
                        #                          <li type=square>"),
                        #                     p(),
                        #                     p("t-statistic = \\(\\frac{\\bar x -\\mu_0}{s_{x}/\\sqrt{n}}\\)"),
                        #                     HTML("</ul>")),
                        #                   br(),
                        #                   code("Two-sample t-test:",style="color:navy"),
                        #                   p(HTML("<ul>
                        #                          <li type=square> the parameter of interest is the difference between
                        #                          the two population means, &mu;<sub>1</sub>-&mu;<sub>2</sub>
                        #                          <li type=square>"),
                        #                     p(),
                        #                     p("t-statistic = \\(\\frac{(\\bar x_1 - \\bar x_2) -(\\mu_1-\\mu_2)}
                        #                       {\\sqrt{\\frac{s_{1}^2}{n_1} + \\frac{s_{2}^2}{n_2}}}\\)"),
                        #                     HTML("</ul>")))),
                        #
                        #          column(1))
                        ),
             # navbarMenu("New",
             #            tabPanel("new",
             #                     includeMarkdown("learnr.Rmd")),
             #            tabPanel("new mini",
             #                     includeMarkdown("learnr_mini.Rmd"))),
             navbarMenu("Shiny Basics",
                        tabPanel("Shiny Parts 1",
                                 includeMarkdown("TypesofShiny.md")),
                        tabPanel("Shiny Parts 2",
                                 includeMarkdown("TypesofShiny2.md")),
                        tabPanel("App File Formats",
                                 includeMarkdown("AppFileFormats.md")),
                        tabPanel("Download Handlers",
                                 includeMarkdown("TypesofShiny3.md")),
                        tabPanel("App Layout Guide",
                                 includeMarkdown("AppLayoutGuide.md"))#,

                        # tabPanel("Reactive programming"),
                        # tabPanel("Basic Commands",
                        #          actionButton("action", label = "Action"),
                        #          hr(),
                        #          fluidRow(column(2, verbatimTextOutput("value")))),
                        # tabPanel("Separate UI and server files"),
                        # tabPanel("Single app file")
                        ) #,
             # navbarMenu("Shiny Layouts",
             #            tabPanel("Sidebar layout",
             #                     sidebarLayout(position = "left",
             #                                   sidebarPanel(
             #                                     sliderInput(inputId = "bins",
             #                                                 label = "Number of bins:",
             #                                                 min = 1,
             #                                                 max = 50,
             #                                                 value = 30)
             #                                   ),
             #
             #                                   mainPanel(
             #                                     plotOutput("distPlot")
             #                                   )
             #
             #                                   )
             #                     ), # end sidebarLayout
             #            tabPanel("Gridlayout",
             #                     fluidPage(
             #
             #                       titlePanel("Hello Shiny!"),
             #
             #                       fluidRow(
             #
             #                         column(4,
             #                                wellPanel(
             #                                  sliderInput("obs", "Number of observations:",
             #                                              min = 1, max = 1000, value = 500)
             #                                )
             #                         ),
             #
             #                         column(8,
             #                                plotOutput("distPlot")
             #                         )
             #                       )
             #                     )), # End Grid layout
             #            tabPanel("Dashboard Layout",
             #                     dashboardPage(
             #                       dashboardHeader(title = "Basic dashboard"),
             #                       dashboardSidebar(
             #                         sidebarMenu(
             #                           menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
             #                           menuItem("Widgets", tabName = "widgets", icon = icon("th"))
             #                         )
             #                       ),
             #                       dashboardBody(
             #                         tabItems(
             #                           # First tab content
             #                           tabItem(tabName = "dashboard",
             #                                   fluidRow(
             #                                     column(4, plotOutput("plotHIST")),
             #                                     column(4, sliderInput("slider", "Number of observations:", 1, 100, 50))
             #                                   )
             #                           ),
             #
             #                           # Second tab content
             #                           tabItem(tabName = "widgets",
             #                                   h2("Widgets tab content")
             #                           )
             #                         )
             #                       )
             #                     )
             #            ),
             #            tabPanel("Tabsets"),
             #            tabPanel("Navlists"),
             #            tabPanel("Navbar Pages")
             #            )
             ) # End navbarPage
)

