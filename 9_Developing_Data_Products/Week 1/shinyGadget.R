selectData <- function() {
  ui <- miniPage(
    gadgetTitleBar("Select some data"),
    miniContentPanel(
      plotOutput("p", height="100%", brush="b")
    )
  )
  server <- function(input, output, session) {
    output$p <- renderPlot({
      plot(iris$Petal.Length, iris$Petal.Width, col=iris$Species)
    })
    observeEvent(input$done, {
      stopApp(brushedPoints(iris, input$b, xvar="Petal.Length", yvar="Petal.Width"))
    })
  }
  runGadget(ui, server)
}