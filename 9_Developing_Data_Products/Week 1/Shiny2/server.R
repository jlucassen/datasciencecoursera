library(shiny)
library(caret)
shinyServer(function(input, output) {
  rf <- train(mpg~wt, data=mtcars, method="rf")
  rp <- train(mpg~wt, data=mtcars, method="rpart")
  lr <- lm(mpg~wt, data=mtcars)
  er <- lm(mpg~log10(wt), data=mtcars)
  ir <- lm(mpg~I(1/wt), data=mtcars)
  pred_rf <- reactive({predict(rf, newdata=data.frame(wt=input$wt))[[1]]})
  pred_rp <- reactive({predict(rp, newdata=data.frame(wt=input$wt))[[1]]})
  pred_lr <- reactive({predict(lr, newdata=data.frame(wt=input$wt))[[1]]})
  pred_er <- reactive({predict(er, newdata=data.frame(wt=input$wt))[[1]]})
  pred_ir <- reactive({predict(ir, newdata=data.frame(wt=input$wt))[[1]]})
  output$pred_rf <- pred_rf
  output$pred_rp <- pred_rp
  output$pred_lr <- pred_lr
  output$pred_er <- pred_er
  output$pred_ir <- pred_ir
  output$plot <- renderPlot({
    plot(mtcars$wt, mtcars$mpg, pch=16, xlim=c(0, 6), ylim=c(0, 35))
    if (input$rf) {
      lines(seq(0, 6, 0.1), predict(rf, newdata=data.frame(wt=seq(0, 6, 0.1))), col='red', lw=2)
      points(input$wt, pred_rf(), pch=16, cex=2, col='red')
    }
    if (input$rp) {
      lines(seq(0, 6, 0.1), predict(rp, newdata=data.frame(wt=seq(0, 6, 0.1))), col='blue', lw=2)
      points(input$wt, pred_rp(), pch=16, cex=2, col='blue')
    }
    if (input$lr) {
      abline(lr, col='orange', lw=2)
      points(input$wt, pred_lr(), pch=16, cex=2, col='orange')
    }
    if (input$er) {
      lines(seq(0, 6, 0.1), predict(er, newdata=data.frame(wt=seq(0, 6, 0.1))), col='green', lw=2)
      points(input$wt, pred_er(), pch=16, cex=2, col='green')
    }
    if (input$ir) {
      lines(seq(0, 6, 0.1), predict(ir, newdata=data.frame(wt=seq(0, 6, 0.1))), col='purple', lw=2)
      points(input$wt, pred_ir(), pch=16, cex=2, col='purple')
    }
  })
})
