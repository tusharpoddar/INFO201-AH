library(shiny)
library(dplyr)
library(leaflet)
library(shinydashboard)
library(rgdal)
library(DT)
library(shinyWidgets)
crime_df <-read.csv('crime_data.csv')

df <- read.csv("listings.csv", stringsAsFactors = FALSE)
seattle_data <- df %>% 
  select(name, # this is the name of the airBNB
         neighbourhood, # area in which the airBnB is present 
         street, # exact address
         latitude, # latitude
         longitude, # longitude
         maximum_nights,# max night limit
         minimum_nights, # min nights limit
         accommodates, # accupancy of?
         price, # price per night
         property_type # appartment or the whole house, etc
    )

# Define server logic ----
server <- function(input, output, session) {
  data <- reactive({
    x <- df
  })

  output$mymap <- renderLeaflet({
    df <- data() %>% 
      filter(neighbourhood == input$neighbourhood_input,
             price >= paste("$", input$price_input[1], sep=""),
             price <= paste("$", input$price_input[2], sep=""),
             minimum_nights >= input$minimum_nights_input[1],
             minimum_nights <= input$minimum_nights_input[2],
             property_type == input$property_type_input)
    m <- leaflet() %>%
      addTiles() %>%
      setView(lng = -122.349358, lat = 47.620422, zoom = 11.25) %>% 
      addCircleMarkers(lng = df$longitude,
                 lat = df$latitude,
                 radius = 0,
                 popup = paste("Average price:", df$price, "<br>",
                               "Minimum nights:", df$minimum_nights, "<br>")) 
    
      # check to see if showcrime toggle is on
      if (input$showcrime) {
        m %>% addCircleMarkers(lng = crime_df$Longitude,
                         lat = crime_df$Latitude,
                         radius = 0,
                         popup = paste(crime_df$Event.Clearance.Group, "<br>",
                                       crime_df$Event.Clearance.Date),
                         color = 'red')
      } else {
        m
      } #end of crime toggle
      
    
  })
  
  output$seattle_data <- renderTable({
    neighbourhoodFilter <- filter(seattle_data,
                                  seattle_data$neighbourhood == input$neighbourhood_input,
                                  price >= paste("$", input$price_input[1], sep=""),
                                  price <= paste("$", input$price_input[2], sep=""),
                                  seattle_data$property_type == input$property_type_input,
                                  seattle_data$minimum_nights >= input$minimum_nights_input[1],
                                  seattle_data$minimum_nights <= input$minimum_nights_input[2])
  })
}