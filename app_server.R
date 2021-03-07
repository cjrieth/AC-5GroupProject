library(ggplot2)
library(dplyr)
library(lintr)
library(shiny)

server <- function(input, output) {
  output$something <- renderPlotly({
    plot <- data %>%
      filter(country == input$) %>%
      
    ggplot(plot) +
      geom_point(mapping = aes(x =  year, y = )) +
      labs(title = "Something", 
           x = "blub", y = "bleh")
  })
  output$oil_v_time <- renderPlotly({
    plot <- data %>%
      filter(country == input$) %>%

    ggplot(plot) +
      geom_point(mapping = aes(x =  year, y = )) +
      labs(title = "Something", 
           x = "blub", y = "bleh")
  })
}
