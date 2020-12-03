---
title: "The Seven Building-blocks of a Shiny App"
output: html_document
---

The structure for `app.r`:

```
library(shiny)

ui <- fluidPage(
  sidebarLayout(
    sidebarPanel(
      #####
      ##### UI components here
      #####
    ),
    mainPanel(
      #####
      ##### Output components here
      #####
    )
  )
)

  server <- function(input, output) {
      #####
      ##### Reactive components here
      #####
  
    output$plot <- renderPlot({
      #####
      ##### Plotting functions here
      #####
    })
  }
  
shinyApp(ui, server)
```

Alternatively:

```
library(shiny)

runApp(shinyApp(
  ui = fluidPage(
  
  sidebarLayout(
    sidebarPanel(
      #####
      ##### UI components here
      #####
    ),
    mainPanel(
      #####
      ##### Output components here
      #####
    )

)),

server = function(input, output) {
      #####
      ##### Reactive components here
      #####
  
    output$plot <- renderPlot({
      #####
      ##### Plotting functions here
      #####
    })
}))
```

Typically, you'll have two or more files:

1. `ui.R` for all your UI
2. `server.r` for all you server-side analysis, and possibly...
3. `global.R` for all your pre-app code.

`ui.R`

```
shinyUI(fluidPage(
  sidebarLayout(
    sidebarPanel(
      #####
      ##### UI components here
      #####
    ),
    mainPanel(
      #####
      ##### Output components here
      #####
    )
  ))
```

`server.R`


```
function(input, output) {
      #####
      ##### Reactive components here
      #####
  
    output$plot <- renderPlot({
      #####
      ##### Plotting functions here
      #####
    })
}
```

`global.R`

```
# any necessary code that should be run before the app starts.
```

