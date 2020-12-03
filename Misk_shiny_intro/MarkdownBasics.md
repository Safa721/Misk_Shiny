---
title: "R Markdown"
output: html_document
---

# Basic Markdown Components

There are three components to an R markdown file:

- The YAML header
- Non-code commentary
- Code chunks

## The YAML Header

Every markdown file must begin with a YAML header, which specifies how the document should be compiled. By compiled we mean the merging of non-code commentary and code chunks in a single output file. The minimum YAML header for an interactive document is:

```
---
output: html_document
runtime: shiny
---
```

This simply means we want an HTML document and that shiny will provide the interactivity for us.

## Code Chunks

R code appears in code *chunks*. *All* code chunks have the basic structure: 

&#96;&#96;&#96;{r}<br>
&#96;&#96;&#96; 

R code is sandwiched between these codes. This is like a signal to tell the compiler that the non-code commentary is over, and this part should be processed as `R` code. The `r` inside the opening of the code chunk is necessary, since it's possible to use other languages within the same document.

When the document is compiled, each chunk is executed sequentially. For the purposes of this workshop, we'll just use Markdown to create our first interactive document then we'll move onto shiny proper.

## Non-code Commentary

This is where markdown comes into play. Mark*down* is a simplified version of a mark*up* language. where you can incorporate non-code commentary into your document. This is not the focus of this workshop, so we won't go into detail here.

<!-- For example, HTML and LaTeX are mark*up* languages which can be tedious to write or difficult to learn. In contrast, markdown is both easy to write and learn! Compare some common commands in table \ref{tab:latex_md}. -->

<!-- Some commands are actually the same, but because there are so many more options in \LaTeX, it can be overwhelming to learn. For example, to get a bulleted list, such as: -->

<!-- - item 1 -->
<!-- - item 2 -->
<!-- - item 3 -->

<!-- ...is pretty straight-forward in markdown: -->

<!-- ``` -->
<!-- - item 1 -->
<!-- - item 2 -->
<!-- - item 3 -->
<!-- ``` -->

<!-- But in LaTeX it would be written as: -->

<!-- ``` -->
<!-- \begin{itemize} -->
<!--   \item item 1 -->
<!--   \item item 2 -->
<!--   \item item 3 -->
<!-- \end{itemize} -->
<!-- ``` -->

<!-- In addition, you can also use `#` to add section headings, where the number of `#` denotes the level of header. Note the distinction to `#` as a comment character in R! -->

<!-- # Header 1 -->
<!-- ## Header 2 -->
<!-- ### Header 3 -->
<!-- #### Header 4 -->
<!-- ##### Header 5 -->
<!-- ###### Header 6 -->
