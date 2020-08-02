library(shiny)
shinyServer(function(input, output) {
    output$cluster <- renderPlot({
      x <- rnorm(n=input$num, mean=input$s_x, sd=input$sd_x)
      y <- rnorm(n=input$num, mean=input$s_y, sd=input$sd_y)
      plot(x, y, xlim=c(-25, 25), ylim=c(-25,25))
    })
})