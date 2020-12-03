---
title: "render functions"
output: html_document
---



`render*()` output functions are specified in the following ways:

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
    <th class="tg-9hbo">Render Function<br>(on server side)</th>
  </tr>
  <tr>
    <td class="tg-yw4l">Plot</td>
    <td class="tg-yw4l">renderPlot()</td>
  </tr>
  <tr>
    <td class="tg-n1xd">Text</td>
    <td class="tg-n1xd">renderText()</td>
  </tr>
  <tr>
    <td class="tg-yw4l">Formatted table</td>
    <td class="tg-yw4l">renderTable()</td>
  </tr>
  <tr>
    <td class="tg-yw4l"></td>
    <td class="tg-yw4l">DT::renderDataTable()</td>
  </tr>
  <tr>
    <td class="tg-yzt1">Console text</td>
    <td class="tg-yzt1">renderPrint()</td>
  </tr>
  <tr>
    <td class="tg-yw4l">Generate UI Elements</td>
    <td class="tg-yw4l">renderUI()</td>
  </tr>
  <tr>
    <td class="tg-yw4l"></td>
    <td class="tg-yw4l">renderImage()</td>
  </tr>
</table>
