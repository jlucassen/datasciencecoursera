library(shiny)
shinyServer(function(input, output) {
    output$caesarOut <- reactive({
      nums <- utf8ToInt(input$caesarIn)
      uppr <- which(nums>=65&nums<=90)
      lowr <- which(nums>=97&nums<=122)
      key <- input$caesarKey
      if (input$caesarED=='Decode') {key <- -key}
      nums[uppr] <- nums[uppr] - 65
      nums[lowr] <- nums[lowr] - 97
      nums[c(uppr, lowr)] <- nums[c(uppr, lowr)] + key
      nums[c(uppr, lowr)] <- nums[c(uppr, lowr)]%%26
      nums[uppr] <- nums[uppr] + 65
      nums[lowr] <- nums[lowr] +97
      return(intToUtf8(nums))
    })
    output$atbashOut <- reactive({
      nums <- utf8ToInt(input$atbashIn)
      uppr <- which(nums>=65&nums<=90)
      lowr <- which(nums>=97&nums<=122)
      nums[uppr] <- nums[uppr] + 2*(77.5-nums[uppr])
      nums[lowr] <- nums[lowr] + 2*(109.5-nums[lowr])
      return(intToUtf8(nums))
    })
    output$vignereOut <- reactive({
      nums <- utf8ToInt(input$vignereIn)
      uppr <- which(nums>=65&nums<=90)
      lowr <- which(nums>=97&nums<=122)
      key <- utf8ToInt(tolower(input$vignereKey))-97
      if (input$vignereED=='Decode') {key <- -key}
      nums[uppr] <- nums[uppr] - 65
      nums[lowr] <- nums[lowr] - 97
      locs <- c(uppr, lowr)[order(c(uppr, lowr))]
      nums[locs] <- nums[locs] + key
      nums[locs] <- nums[locs]%%26
      nums[uppr] <- nums[uppr] + 65
      nums[lowr] <- nums[lowr] +97
      return(intToUtf8(nums))
    })
})
