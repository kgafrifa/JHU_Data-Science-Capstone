#
# Coursera Data Science Capstone - Final Project
# 
#

# REFERENCE THEME: http://shiny.fee.tche.br/examples/117-shinythemes/

# load libraries; don't display metadata
suppressPackageStartupMessages(c(
  library(shinythemes),
  library(shiny)
))

# give the application a title and browser tab text
appTitle = (div(HTML("<center>John Hopkins SwiftKey Coursera Data Science Capstone</center>")))
browserText = "Capstone"

# create tabs and panels
shinyUI(fluidPage(titlePanel(appTitle,browserText),
                  
  hr(), # styling
  tags$head(tags$style(HTML("
    #final_text {
      text-align: center;
    }
    div.box-header {
      text-align: center;
    }
    "))),
                  
    theme = shinytheme("cerulean"),
                  
    navbarPage("Next Word Prediction",id ="navpanel",
                             
    # Home tab is panel with a sidebar and main sections  
    tabPanel("Home",
      sidebarLayout(
                                        
      #sidebar - Instructions 
        sidebarPanel(id="sidebarPanel"
                     , includeHTML("./instructions.html")
        ),
                                        
        # mainpanel - text prediction app
        mainPanel(id="mainpanel",
                  tags$div(textInput(inputId = "str", 
                                     label = h4("Input Text:"),
                                     value = ),
                           tags$span(style="color:red"),
                           br(),
                           tags$hr(),
                           
                           numericInput(
                             inputId = "n",
                             label = h3("Number of Predictions"),
                             min = 1,
                             max = 3,
                             value = 3,
                             step = 1
                           ),
                           br(),
                           tags$hr(),
                           
                           h4("Predicted Word:"),
                           tags$span(style="color:red",
                                     tags$strong(tags$h3(textOutput("pred", container = pre)))),
                           align="center"))
                           
      ),
      
                                      
          # footer
          hr(),
          div(class="footer", includeMarkdown("./footer.md"))
        ),
                             
        # Analysis - the Milestone Report
        tabPanel("Exploratory Analysis", includeHTML("./milestone_report.html")),
                             
        # References - Text Mining, Natural Language Processing
        tabPanel("Technical References", includeHTML("./references.html")),
                             
        # Partners - Coursera, Johns Hopkins, Swiftkey
        tabPanel("Partners",includeMarkdown("./partners.md")),
                             
        # About - R, Shiny, and me
        tabPanel("About",includeHTML("./about.html")),
    
        tags$hr()                      
      
   )))
