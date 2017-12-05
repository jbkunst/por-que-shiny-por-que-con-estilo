library(shiny)

ui <- fluidPage(
   sidebarLayout(
      sidebarPanel(
         sliderInput("nrandom", "N a simular:",
                     min = 1, max = 50, value = 30),
         selectInput("type", "Tipo:", choices = c("p", "l", "b"))
      ),
      mainPanel(plotOutput("outplot"))
   )
)

server <- function(input, output) {
   output$outplot <- renderPlot({
     x <- rnorm(input$nrandom)
     plot(cumsum(x), type = input$type)
   })
}

shinyApp(ui = ui, server = server)