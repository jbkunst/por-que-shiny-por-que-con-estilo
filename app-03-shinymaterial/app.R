library(shiny)
library(shinymaterial)

ui <- material_page(
  nav_bar_color = "blue",
  material_row(
    material_column(
      width = 4, 
      material_card(
        depth = 4,
        material_slider("nrand", "Simulaciones", min_value = 50,
                        max_value = 100, initial_value = 70),
        material_dropdown("col", "Color", c("red", "blue", "black")),
        material_checkbox("punto", "Puntos", initial_value = TRUE)
      )
    ),
    material_column(
      width = 8,
      material_card(plotOutput("outplot"), depth = 4)
    )
  )
)

server <- function(input, output) {
  output$outplot <- renderPlot({
    set.seed(123)
    x <- rnorm(input$nrand)
    t <- ifelse(input$punto, "b", "l")
    plot(x, type = t, col = input$col)
  })
}

shinyApp(ui = ui, server = server)
# runApp("app-03-shinymaterial/", launch.browser = TRUE)