# Shiny app for markup
library(shiny)
library(datasets)
library(MASS)
dat <- birthwt

# User interface
ui <- fluidPage(
  # App title ----
  titlePanel("Plotting of Birthweight data set"),
  
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    
    # Sidebar panel for inputs ----
    sidebarPanel(
      
      # Input: Slider for the number of bins ----
      titlePanel("Input"),
      sliderInput(inputId = "bins",
                  label = "Number of bins:",
                  min = 10,
                  max = 30,
                  value = 20),
      selectInput(inputId = "var",
                  label = "variable for the plot",
                  choices = c("Age" = "age", "Smoke" = "smoke", "Birthweight" = "bwt")),
      radioButtons(inputId = "color",
                   label = "colour of the bars",
                   choiceNames = list("Blue", "Red", "Yellow"),
                   choiceValues = list("cornflowerblue", "red3", "gold1"))
      
    ),
    
    # Main panel for displaying outputs ----
    mainPanel(
      
      # Output: Histogram ----
      plotOutput(outputId = "distPlot"),
      p("This is a very simple app. I already had some earlier experience with Shiny. For the course 'Survey Data Analysis', Sofia Villalobos and I made a Shiny app at the following website:"),
      a("https://bootstrapsalvaje.shinyapps.io/shiny_final/", href = "https://bootstrapsalvaje.shinyapps.io/shiny_final/")
      
    )))



# Server
server <- function(input, output){
  output$distPlot <- renderPlot({
    hist(dat[,input$var], breaks = input$bins, col = input$color,
         xlab = input$var,
         main = input$var)
  })
}

shinyApp(ui = ui, server = server)
