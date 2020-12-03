# External functions for R Markdown:

makePlot <- function(dataframe, x, y) {
  ggplot(get(dataframe), aes_string(x, y)) +
    geom_point() +
    theme_classic()
}

# makePlot("mtcars", "mpg", "wt")
