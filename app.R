
---

### 🧩 2. **app.R**

```r
# app.R — COVID-19 Vaccine Coverage Dashboard

library(shiny)
library(plotly)
library(leaflet)
library(dplyr)
library(readr)
library(shinythemes)
library(DT)

source("R/helpers.R")
source("R/plotting.R")
source("R/mapping.R")

ui <- fluidPage(
  theme = shinytheme("flatly"),
  titlePanel("COVID-19 Vaccine Coverage Dashboard — Africa"),

  sidebarLayout(
    sidebarPanel(
      selectInput("country", "Country:", choices = NULL),
      dateRangeInput("daterange", "Date Range:", start = "2021-01-01", end = Sys.Date()),
      selectInput("vaccine", "Vaccine Type:", choices = NULL),
      hr(),
      downloadButton("download_filtered", "Download Filtered Data"),
      hr(),
      h5("Developed by Ludovic Bekou")
    ),

    mainPanel(
      tabsetPanel(
        tabPanel("🌍 Map", leafletOutput("map", height = "550px")),
        tabPanel("📈 Trends", plotlyOutput("trend_plot", height = "550px")),
        tabPanel("📋 Data", DTOutput("table"))
      )
    )
  )
)

server <- function(input, output, session) {

  # Load and prepare dataset
  data <- load_vaccine_data("data/vaccine_data.csv")

  # Populate selectors
  observe({
    updateSelectInput(session, "country", choices = sort(unique(data$Country)))
    updateSelectInput(session, "vaccine", choices = sort(unique(data$Vaccine)))
  })

  # Reactive filtered dataset
  filtered_data <- reactive({
    filter_data(data, input$country, input$vaccine, input$daterange)
  })

  # Render map
  output$map <- renderLeaflet({
    render_vaccine_map(filtered_data())
  })

  # Render time-series plot
  output$trend_plot <- renderPlotly({
    plot_vaccine_trend(filtered_data(), input$country)
  })

  # Render data table
  output$table <- renderDT({
    datatable(filtered_data())
  })

  # Download handler
  output$download_filtered <- downloadHandler(
    filename = function() paste0("vaccine_data_", Sys.Date(), ".csv"),
    content = function(file) write_csv(filtered_data(), file)
  )
}

shinyApp(ui, server)
