---
title: "The Seven Building-blocks of a Shiny App"
output: html_document
---



## Part 5: Modularize code with `reactive({})`

`Reactive()` is for calculating values. This means any kinds of calculations that you need to run. They do not have side effects, which means they do not change the environment. They create a reacive object (a reactive expression), making an object to *use*.

`Reactive()` converts a normal expression (i.e. function) into a reactive expression. Conceptually, a reactive expression is a expression whose result will change over time.

The contents need to be reactive and it's different to regular objects in two ways:

```
myData <- reactive({read.delim("results.txt")})
```

1. You call a reactive expression like a function. They are technically functions, so you have to call it as if it's a function: `myData()` and *not* `myData`, as if it were are regular data frame.

2. Reactive expressions **cache** their values (the expression will return its most recent value, unless it has become invalidated). i.e. they know if they are invalid or invalid. So you can think of a reactive expression as a regular function that gets cached.

## Part 5b: Delay reactions with `eventReactive(condition, {})`

e.g. Update button changes the graph.

Makes a reactive expression, but has a different syntax.

- First argument: A reactive expression that only responds to specific values
- Second argument: Code used to build (and rebuild) object

In the UI:

```
# input
actionButton("button", "Show"),
numericInput("x", "Value", 5)

# output
tableOutput("table")
```

In the server:

```
# Reactive expressions
df <- eventReactive(input$button, {
        head(cars, input$x)
      })
      
output$table <- renderTable({
        df()
      })      
```

### reactive()/eventReactive()

1. It *can be called* and *returns a value*, like a function. Either the last expression, or return().
2. It’s *lazy*. It doesn’t execute its code until somebody calls it (even if its reactive dependencies have changed). Also like a function.
3. It’s *cached*. The first time it’s called, it executes the code and saves the resulting value. Subsequent calls can skip the execution and just return the value.
4. It’s *reactive*. It is notified when its dependencies change. When that happens, it clears its cache and notifies it dependents.

## Part 6: Prevent reactions with `isolate()`

`isolate()` prevents reactivity. It's analogous to `reactive()`, but it returns the result as a non-reactive value, i.e. it's an inert reactive.

For example, if you performs a long calculation or download a large data set, you may want it to execute only when am `actionButton` is clicked. The starting value of the `actionButton` is 0. Each time you click on it, it increases by. i.e. *something* changed.

```
ui <- pageWithSidebar(
  headerPanel("Click the button"),
  sidebarPanel(
    sliderInput("obs", "Number of observations:",
                min = 0, max = 1000, value = 500),
    actionButton("goButton", "Go!")
  ),
  mainPanel(
    plotOutput("distPlot")
  )
)
```

Creating the following plot is dependent on clicking the button, but ignores changes to `input$obs` until the entire reactive expression is executed.

```
server <- function(input, output) {
  output$distPlot <- renderPlot({
    
    # Take a dependency on input$goButton
    input$goButton

    # Use isolate() to avoid dependency on input$obs
    dist <- isolate(rnorm(input$obs))
    hist(dist)
  })
}
```

## Part 7: Performing actions with `observe({})`

`observe({})` says "run this code, run it all the time, and as long and as often as is needed to be up-to-date". e.g.

`observe({print(input$clicks)})`

`observe({})` is for performing actions with side effects, i.e. things that change the environment. Some functions in `R` do things other than return a value - they change variables in the environment, plot graphics, load or save files, or access the network. All these are side effects. e.g. Constantly writing to a log file.

`observe({})` triggers code to run on server and uses the same syntax as `render*()`, `reactive()`, and `isolate()`. However, `observeEvent` is more useful.

## Part 7b: Trigger actions with `observeEvent(condition, {})`

You can execute code using an action buttons by observing it with an `observeEvent()`. i.e. do some action based on some other action that happens on the UI.

`actionButton(inputId = "go", label = "Click Me!")`

`observeEvent(eventExpr = input$go, handlerExpr = {})`: The first argument is one or more reactive values. The observer invalidates **only** when this value changes. The second argument, `handlerExpr` is a code block to run whenever the observer is invalidated (it's like as if it's in an `isolate()` function.). This should be a side-effect producing action, i.e. the return value will be ignored.

Recap:

- `observeEvent()` triggers code to run on the server.
- You get to explictly specify which reactive values should invalidate the observer.
- Use `observe()` for a more implicit syntax. i.e. it tracks every value.

<style type="text/css">
.tg  {border-collapse:collapse;border-spacing:0;border-color:#ccc;}
.tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:0px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#fff;}
.tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:0px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#f0f0f0;}
.tg .tg-0ord{text-align:right}
.tg .tg-yzt1{background-color:#efefef;vertical-align:top}
.tg .tg-e3zv{font-weight:bold}
.tg .tg-lqy6{text-align:right;vertical-align:top}
.tg .tg-9vst{background-color:#efefef;text-align:right}
.tg .tg-bsv2{background-color:#efefef}
.tg .tg-yw4l{vertical-align:top}
.tg .tg-my2k{background-color:#efefef;text-align:right;vertical-align:top}
</style>
<table class="tg">
  <tr>
    <th class="tg-031e"></th>
    <th class="tg-e3zv">reactive()</th>
    <th class="tg-e3zv">observe()</th>
  </tr>
  <tr>
    <td class="tg-0ord">Purpose</td>
    <td class="tg-031e">Calculating values</td>
    <td class="tg-031e">Performing actions</td>
  </tr>
  <tr>
    <td class="tg-9vst">Callable</td>
    <td class="tg-bsv2">Yes</td>
    <td class="tg-bsv2">No</td>
  </tr>
  <tr>
    <td class="tg-lqy6">Returns a value</td>
    <td class="tg-yw4l">Yes</td>
    <td class="tg-yw4l">No</td>
  </tr>
  <tr>
    <td class="tg-my2k">Evaluation</td>
    <td class="tg-yzt1">Lazy</td>
    <td class="tg-yzt1">Eager</td>
  </tr>
  <tr>
    <td class="tg-lqy6">Cached</td>
    <td class="tg-yw4l">Yes</td>
    <td class="tg-yw4l">NA</td>
  </tr>
  <tr>
    <td class="tg-lqy6">Side effects</td>
    <td class="tg-yw4l">Forbidden</td>
    <td class="tg-yw4l">Permitted</td>
  </tr>
</table>

### observe() / observeEvent()

1. It *can’t be called* and *doesn’t return a value*. The value of the last expression will be thrown away, as will values passed to  return().
2. It’s *eager*. When its dependencies change, it executes right away.
3. Since it can’t be called and doesn’t have a return value, there’s *no caching* here.
4. It’s *reactive*. It is notified when its dependencies change, and when that happens it executes (not right at that instant, but ASAP).

## Type 8: Manage state with `reactiveValues()`

You don't have the power to change input from inside the app, but sometimes that is useful. `reactiveValues()` creates a list of reactive values to manipulate programmatically, usually with `observeEvent()`)

This app read in a file and allows you to delete specific rows.

```
library(shiny)

ui <- fluidPage(
  sidebarLayout(
  sidebarPanel(
    fileInput("file", "Upload file"),
    numericInput("Delete", "Delete row:", 1, step = 1),
    actionButton("Go", "Delete!")
  ),
  mainPanel(
    tableOutput("df_data_out")
    )
  )
  )

server <- function(input, output) {

    values <- reactiveValues(df_data = NULL)

    observeEvent(input$file, {
      values$df_data <- read.csv(input$file$datapath)
    })

    observeEvent(input$Go, {
      temp <- values$df_data[-input$Delete, ]
      values$df_data <- temp
    })

    output$df_data_out <- renderTable(values$df_data)
  }

shinyApp(ui, server)
```
