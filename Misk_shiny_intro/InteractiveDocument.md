---
output: html_document
runtime: shiny
---

# Basic Interactive Documents

To make a piece of code interactive, we need three parts: 

1. `inputPanel({})`
2. `input$...`
3. `render*()`

First, an `inputPanel({})` function is used to specify the user interface controls. The `{}` are like the `{}` in making functions. All code that appears here is grouped together.


```r
library(ggplot2)

inputPanel({})
```

The code that we group together is one or more input widgets. See the Widget tab for examples of the types of UI input. e.g. The following inputPanel will produce a radio button list with two items. The first element of a UI input is always the `inputId` although we typically never explictly label it.


```r
library(ggplot2)

inputPanel({
  radioButtons("shape", label = "Circle:",
               c("Filled" = 16,
                 "Hollow" = 1))
})
```

Second, the settings from the UI panel are stored in a list called 'input'. Each element in the list is named after the `inputId` from each of the UI panels. e.g. the `inputId` of the UI input above is `shape`. So we can access it using:  


```r
input$shape
```

Third, a `render*()` function is used to specify the type of output. Replace the `*` with the appropriate output (see the render output tab). In this case we want a plot, in so we should use `renderPlot({})`. Again, we use the curley brackets to indicate that all the commands belong together. Here, instead of specifying a value for the shape, we can use `input$shape` which is specified by the user. In this case we also need to coerce it to numeric, since the selection from a radio buttom will be character.


```r
renderPlot({
  ggplot(mtcars, aes(mpg,wt)) +
    geom_point(shape = as.numeric(input$shape), alpha = 0.75, size = 10)
})
```

All the above code must appear within a single chunk. It's a quick and easy way to get interactive documents but the functionality is limited. To create full fledged applications we'll turn to implementing `shiny` proper.
