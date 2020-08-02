library(shiny)
shinyUI(fluidPage(
    titlePanel("Normal Cluster"),
    sidebarLayout(
        sidebarPanel(
          sliderInput("num", "Number of Points", min=1, max=10000, value=100),
          sliderInput("s_x", "X Mean:", min=-5, max=5, value=0),
          sliderInput("s_y", "Y Mean:", min=-5, max=5, value=0),
          sliderInput("sd_x", "X Standard Deviation:", min=0, max=5, value=1),
          sliderInput("sd_y", "Y Standard Deviation:", min=0, max=5, value=1)
        ),
        mainPanel(
            plotOutput("cluster")
        )
    )
))
