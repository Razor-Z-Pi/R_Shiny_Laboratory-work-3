library(shiny)
library(ggplot2)
library(gapminder)
library(rsconnect)

ui <- fluidPage(
  titlePanel("Визуализация данных"),
  sidebarLayout(
    sidebarPanel(
      h1("Выборка из набора данных gapminder"),
      selectInput("xid",
                  "x - координта:",
                  choices = c("Континент" = "continent",
                              "Год" = "year"
                              ), 
                  selected = "year"),
      selectInput("yid", 
                  "y - координат",
                  choices = c("Население" = "pop",
                              "Продолжительность жизни" = "lifeExp",
                              "ВВП на душу населения" = "gdpPercap"),
                  selected = "pop"
                  ),
      sliderInput("point_size", "Точки", 
                   min = 1,
                   max = 15,
                   value = 10),
      actionButton("refresh", "Обновить график")
    ),
    mainPanel(
      plotOutput("plot")
    )
  )
)

server <- function(input, output, session) {
  observeEvent(input$refresh, {
    output$plot <- renderPlot({
      
      if(input$xid == "continent") x_axis_label <- "Континент"
      if(input$xid == "year") x_axis_label <- "Год"
      
      if(input$yid == "pop") y_axis_label <- "Население (мил.)"
      if(input$yid == "lifeExp") y_axis_label <- "Продолжительность жизни (годы)"
      if(input$yid == "gdpPercap") y_axis_label <- "ВВП на душу населения (фиксированный 2005 международный $)"
      
      p <- ggplot(gapminder, aes_string(x = input$xid, y = input$yid), color = "country") +
        geom_line(aes_string(linewidth = 0.5)) +
        geom_point(size = input$point_size, color = c("red")) +
        labs(x = x_axis_label, y = y_axis_label,
             title = "Данные в gapminder",
             color = "country") 
    
      print(p)  
    })
  })
}

shinyApp(ui = ui, server = server)