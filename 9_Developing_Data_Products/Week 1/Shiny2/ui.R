library(shiny)
library(shinythemes)
shinyUI(fluidPage(theme = shinytheme("simplex"),
  titlePanel("Predict MPG from WT"),
  sidebarLayout(
    sidebarPanel(
      tabsetPanel(type="tabs", 
        tabPanel("Controls", 
          numericInput("wt", "Weight (1000 lbs):", min=0, max=6, value = 3, step=0.01),
          checkboxInput("rf", "Show random forest model", value=F),
          checkboxInput("rp", "Show recursive partitioning model", value=F),
          checkboxInput("lr", "Show linear regression model", value=F),
          checkboxInput("er", "Show exponential regression model", value=F),
          checkboxInput("ir", "Show inverse regression model", value=F)
        ),
        tabPanel("Predictions",
         h4("Random forest prediction:"),
         textOutput("pred_rf"),
         h4("Recursive partition prediction:"),
         textOutput("pred_rp"),
         h4("Linear regression prediction:"),
         textOutput("pred_lr"),
         h4("Exponential regression prediction:"),
         textOutput("pred_er"),
         h4("Inverse Regression prediction:"),
         textOutput("pred_ir")
        )
      )
    ),
    mainPanel(
      plotOutput("plot"),
    )
  )
))
