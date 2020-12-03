library(shinythemes)
library(shiny)
library(knitr)
library(shinydashboard)

if (!("AppLayoutGuide.md" %in% list.files())) {
  rmdfiles <- c("AppLayoutGuide.Rmd",
                "AppFileFormats.Rmd",
                "TypesofShiny.Rmd",
                "TypesofShiny2.Rmd",
                "TypesofShiny3.Rmd",
                "ShinyWidget.Rmd",
                "InteractiveDocument.Rmd",
                "MarkdownBasics.Rmd",
                "widgetsTable.Rmd",
                "renderTable.Rmd")
  sapply(rmdfiles, knit, quiet = T)
}
