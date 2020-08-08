library(shiny)
shinyUI(fluidPage(
  tabsetPanel(
    tabPanel(
      'Caesar',
      br(),
      p('The Caesar Cipher is one of the oldest and simplest methods of encoding
        text - it needs only the message and an integer key. It shifts each 
        letter of the message by that key, wrapping around if it goes past A 
        or Z. "B" with key 1 becomes "C", or with key -2 becomes "Z". To decode,
        follow the same procedure with the key negated.'),
      textInput('caesarIn', 'Input Text'),
      numericInput('caesarKey', 'Key', value=0),
      radioButtons('caesarED', NULL, choices=c('Encode', 'Decode')),
      submitButton("Submit"),
      h4("Output:"),
      textOutput('caesarOut')
    ),
    tabPanel(
      'Atbash',
      br(),
      p('The Atbash Cipher is similar to the Caesar Cipher, but reverses the
      order of the alphabet rather than shifting it. As such, it does not even
      need a key, just the message. In a sense, the "key" encoding the message
      is the simple fact that an Atbash Cipher is being used.'),
      textInput('atbashIn', 'Input Text'),
      radioButtons('atbashED', NULL, choices=c('Encode', 'Decode')),
      submitButton("Submit"),
      h4("Output:"),
      textOutput('atbashOut')
    ),
    tabPanel(
      "Vignere",
      br(),
      p('The Vignere Cipher is a more sophisticated Caesar Cipher, using a text
        key instead of an integer. The key is converted to a series of integers,
        and repeated across the letters of the message, shifting each letter of
        the message by the corresponding integer in the key, with a=0. Encoding
        "ABCD" with the key "CD" would mean shifting A by 2, B by 3, C 2, and D 
        3, resulting in "CEEG". To decode, negate the key after converting to 
        numbers.'),
      textInput('vignereIn', "Input Text"),
      textInput('vignereKey', "Key", value=NULL),
      radioButtons('vignereED', NULL, choices=c('Encode', 'Decode')),
      submitButton("Submit"),
      h4("Output:"),
      textOutput('vignereOut')
    )
  )
))
