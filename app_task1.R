library(shiny)
library(gapminder)
library(rsconnect)

ui <- fluidPage(
  titlePanel("Визуализация данных"),
  sidebarLayout(
    sidebarPanel(
      h1("Вариант 4"),
      h2("Выборка из набора данных gapminder"),
      radioButtons("continent_id", "Континент", 
                  choices = c("Africa", "Asia", 
                              "Europe", "Americas", "Oceania")),
      sliderInput(inputId = "slider_inputpop",
                  label = "Численность населения: ",
                  min = 120447,
                  max = 33333216,
                  value = c(120447, 33333216))
    ),
    mainPanel(
      tableOutput("plot")
    )
  )
)

server <- function(input, output, session) {
    output$plot <- renderTable(subset(gapminder, continent == input$continent_id &
                                      (pop >= input$slider_inputpop[1] &
                                         pop <= input$slider_inputpop[2] )))
}

shinyApp(ui = ui, server = server)