#
# Coursera Data Science Capstone - Final Project
# 
#

# load libraries, suppress metadata
suppressPackageStartupMessages(c(
  library(stringr),
  library(stylo),
  library(tm),
  library(markdown),
  library(bslib)
))

# include helper functions
source("./next-prediction.R")

# server code for shiny
server <- function(input, output, session) {
  output$pred <- renderText({
    preds <- next_word(input$str, input$n)
    paste(preds, collapse="\n")
  })
}