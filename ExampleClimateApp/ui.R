
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#


shinyUI(fluidPage(

  # Application title
  titlePanel("Climate Data Application"),

  # Sidebar with user input controls
  sidebarLayout( 
    sidebarPanel(
      selectInput(inputId='site', 
                  label=h3("Choose SNOTEL Site:"), 
                  choices=unique(snoteldata$Station), 
                  selected = NULL, 
                  multiple = FALSE,
                  selectize = TRUE, 
                  width = NULL, 
                  size = NULL),
      radioButtons(inputId='rcp', 
                  label=h3("Choose RCP:"), 
                  choices=c('RCP2_6','RCP4_5','RCP6_0','RCP8_5'), 
                  inline=TRUE,
                  selected = NULL),
      dateRangeInput("dates",label = h3("Date range"),start="2005-01-02",end="2057-01-01"),
      checkboxInput("checkbox", label = h3("Display Observed Data"), value = FALSE)
     
    ),

    # Show outputs, text, etc. in the main panel
    mainPanel(
      textOutput("selected_rcp"),
      plotOutput("futureplot"),
      textOutput("summaryresults")
    )
  )
))


