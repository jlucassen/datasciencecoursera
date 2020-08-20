library(shiny)
shinyUI(fluidPage(
    titlePanel("SlowLock"),
    sidebarLayout(
        sidebarPanel(
            textInput("text", "label", "value"),
            fluidRow(
                column(width=6, checkboxInput("append", "Append")),
                column(width=6, actionButton("predict", "Predict"))
            )
        ),
        mainPanel(
            textOutput("prediction")
        )
    )
))
