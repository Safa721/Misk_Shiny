---
title: "UI functions"
output: html_document
---



UI input widgets are specified in the following ways:

<style type="text/css">
.tg  {border-collapse:collapse;border-spacing:0;border-color:#ccc;}
.tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:0px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#fff;}
.tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:0px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#f0f0f0;}
.tg .tg-n1xd{background-color:#efefef;color:#333333;vertical-align:top}
.tg .tg-yzt1{background-color:#efefef;vertical-align:top}
.tg .tg-9hbo{font-weight:bold;vertical-align:top}
.tg .tg-yw4l{vertical-align:top}
</style>
<table class="tg">
  <tr>
    <th class="tg-9hbo">Desired Item</th>
    <th class="tg-9hbo">Comment</th>
    <th class="tg-9hbo">Function<br>(on server side)</th>
  </tr>
  <tr>
    <td class="tg-yw4l">Action Button</td>
    <td class="tg-yw4l">Activate a specific command</td>
    <td class="tg-yw4l"><tt>actionButton("action", label = "Execute")</tt></td>

  </tr>
  <tr>
    <td class="tg-n1xd">Single Checkbox</td>
    <td class="tg-n1xd">On/off switch</td>
    <td class="tg-n1xd"><tt>checkboxInput("checkbox", label = "Show points", value = TRUE)</tt></td>
    
  </tr>
  <tr>
    <td class="tg-yw4l">Checkbox group</td>
    <td class="tg-yw4l">One or multiple choices</td>
    <td class="tg-yw4l"><tt>checkboxGroupInput("checkGroup", label = "Select options",<br>  choices = list("Carbs" = 1, "Proteins" = 2, "Fat" = 3),<br>  selected = 1),()</tt></td>
  </tr>
  
    <tr>
    <td class="tg-yzt1">Radio buttons</td>
    <td class="tg-yzt1">Select only one item</td>
    <td class="tg-yzt1"><tt>radioButtons("radio", label = "Selection options",<br>
    choices = list("Carbs" = 1, "Proteins" = 2, "Fat" = 3),<br>
    selected = 1)</tt></td>
  </tr>
  
  <tr>
    <td class="tg-yw4l">Select box</td>
    <td class="tg-yw4l">pull-down menu</td>
    <td class="tg-yw4l"><tt>selectInput("select", label = "Select options",<br>
    choices = list("Carbs" = 1, "Proteins" = 2, "Fat" = 3),<br>
    selected = 1)</tt></td>
  </tr>

  <tr>
    <td class="tg-yzt1">Slider</td>
    <td class="tg-yzt1">Numeric slider, single value</td>
    <td class="tg-yzt1"><tt>sliderInput("slider1", label = "Pick a number", min = 0,<br>
        max = 100, value = 50)</tt></td>
  </tr>

  <tr>
    <td class="tg-yw4l">Slider range</td>
    <td class="tg-yw4l">Numeric slider, two values</td>
    <td class="tg-yw4l"><tt>sliderInput("slider2", label = "Pick a number range", min = 0,<br>
        max = 100, value = c(40, 60))</tt></td>
  </tr>


  <tr>
    <td class="tg-yzt1">Text input</td>
    <td class="tg-yzt1">Enter text</td>
    <td class="tg-yzt1"><tt>textInput("text", label = "ID value:", value = "Enter text...")</tt></td>
  </tr>

  
  <tr>
    <td class="tg-yw4l">Date Input</td>
    <td class="tg-yw4l">Select a date</td>
    <td class="tg-yw4l"><tt>dateInput("date", label = "Choose date", value = "2014-01-01")</tt></td>
  </tr>
  <tr>
    <td class="tg-yzt1">Date Range</td>
    <td class="tg-yzt1">Select a period of time</td>
    <td class="tg-yzt1"><tt>dateRangeInput("dates", label = "Choose date range")</tt></td>
  </tr>
  
  <tr>
    <td class="tg-yw4l">File input</td>
    <td class="tg-yw4l">Upload a file</td>
    <td class="tg-yw4l"><tt>fileInput("file", label = "File input")</tt></td>
  </tr>
  
  <tr>
    <td class="tg-yzt1">Numeric input</td>
    <td class="tg-yzt1">Enter a number</td>
    <td class="tg-yzt1"><tt>numericInput("num", label = "Numeric input", value = 1)</tt></td>
  </tr>
</table>
  




