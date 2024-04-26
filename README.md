# R_Shiny_Laboratory-work-3
Лабораторная работа №3 – Построение веб-приложений с помощью Shiny (на примере набора данных gapminder) / Lab work #3 - Building web applications with Shiny (using gapminder dataset as an example)
_________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________
shiny – пакет языка R, позволяющий легко создавать интерактивные веб-приложения непосредственно из R. / shiny is an R language package that makes it easy to create interactive web applications directly from R.
_________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________

Шаблон Shiny-приложения имеет следующий вид / The Shiny application template is as follows::

```R
library("shiny") # Загрузка пакета shiny / Downloading the shiny package
ui <- fluidPage() # Создание веб-страницы с помощью функции fluidPage() UI -- приложения Shiny / Create a web page using fluidPage() UI -- Shiny application
server <- function(input, output) {} # Создание части server, где описывается логика приложения / Creating a server part that describes the application logic
shinyApp(ui = ui, server = server) # Соединение UI server для запуска приложения / UI server connection to run the application
```
_______________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________
Установка необходимых пакетов / Installing the necessary packages
```R
install.packages("shiny")
install.packages("rsconnect")
```
_______________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________
Подключите пакет rsconnect и запустите функцию rsconnect::setAccountInfo(), чтобы указать свои учетные данные для shinyapps.io / Plug in the rsconnect package and run the rsconnect::setAccountInfo() function to specify your credentials for shinyapps.io
```R
library(rsconnect)
rsconnect::setAccountInfo(name='your_shinyappsio_account_name', 
                          token='your_shinyappsio_token', 
                          secret='your_shinyappsio_secret')
```
Замените your_shinyappsio_account_name, your_shinyappsio_token и your_shinyappsio_secret на свои реальные данные. Вы можете найти свой токен и секрет на сайте shinyapps.io в разделе Tokens / Replace your_shinyappsio_account_name, your_shinyappsio_token and your_shinyappsio_secret with your real data. You can find your token and secret on shinyapps.io under Tokens
_______________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________
Используйте функцию rsconnect::deployApp() для задеплоя вашего Shiny приложения / Use the rsconnect::deployApp() function to deploy your Shiny application
```R
rsconnect::deployApp('path_to_your_shiny_app')
```
Вместо path_to_your_shiny_app укажите путь к вашему Shiny приложению / Instead of path_to_your_shiny_app, specify the path to your Shiny app
_______________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________
Задание 1 – С помощью пакета shiny, используя набор данных gapminder пакета gapminder, постройте интерактивное веб-приложение, с функционалом, соответствующим варианту задания. / Task 1 - Using the shiny package, using the gapminder dataset of the gapminder package, build an interactive web application, with functionality appropriate to the assignment option.
_______________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________
Задание 2 – С помощью пакета shiny, используя набор данных gapminder пакета gapminder, постройте интерактивное веб-приложение, позволяющее строить график формата ggplot, по заданным настройкам. Приложение должно содержать минимум 3 конструкции типа input. Также необходимо оформить приложение соответствующим образом, т.е. необходимо, чтобы каждая из форм ввода входных данных имела соответствующую подпись, также, как и итоговый график, формируемый приложением. / Task 2 - Using the shiny package, using the gapminder dataset of the gapminder package, build an interactive web application that allows you to plot a ggplot format graph, according to the given settings. The application must contain at least 3 constructs of type input. It is also necessary to design the application appropriately, i.e. each of the input data input forms must have an appropriate caption, as well as the final graph generated by the application.
