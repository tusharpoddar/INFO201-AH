library(shiny)
library(dplyr)
library(leaflet)
library(shinydashboard)
library(rgdal)
library(DT)
library(shinyWidgets)
library(ggplot2)

crime_df <-read.csv('crime_data.csv')

df <- read.csv("listings.csv", stringsAsFactors = FALSE)
neighborhoods_df <- as.data.frame(table(df$neighbourhood_group_cleansed))
seattle_data <- df %>% 
  select(name, # this is the name of the airBNB
         neighbourhood, # area in which the airBnB is present 
         street, # exact address
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
    
    # making the new dataframe
    new_latitude <- mean(df$latitude)
    new_longitude <- mean(df$longitude)
    
    max_lat <- max(df$latitude) - mean(df$latitude)
    max_long <- max(df$longitude) - mean(df$longitude)
    min_lat <- mean(df$latitude) - min(df$latitude)
    min_long <- mean(df$longitude) - min(df$longitude)
    
    extra_lat <- 0.005
    extra_long <- 0.01
    
    new_df <- crime_df %>%
      filter(crime_df$Latitude >= new_latitude - min_lat - extra_lat
             & crime_df$Latitude <= new_latitude +  max_lat + extra_lat, 
             crime_df$Longitude >= new_longitude - min_long - extra_long
             & crime_df$Longitude <= new_longitude + max_long + extra_long)
    
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
        m %>% addCircleMarkers(lng = new_df$Longitude,
                         lat = new_df$Latitude,
                         radius = 0,
                         popup = paste(new_df$Event.Clearance.Group, "<br>",
                                       new_df$Event.Clearance.Date),
                         color = 'red')
      } else {
        m
      } #end of crime toggle
      
    
  })
  
  output$seattle_data <- renderTable({
    neighborhood_filter <- filter(seattle_data,
                                  seattle_data$neighbourhood == input$neighbourhood_input,
                                  price >= paste("$", input$price_input[1], sep=""),
                                  price <= paste("$", input$price_input[2], sep=""),
                                  seattle_data$property_type == input$property_type_input,
                                  seattle_data$minimum_nights >= input$minimum_nights_input[1],
                                  seattle_data$minimum_nights <= input$minimum_nights_input[2])
    colnames(neighborhood_filter) <- c("Name", "Neighborhood", "Street", "Max Nights", "Min Nights", 
                         "Accommodates", "Price", "Property Type")
    return(neighborhood_filter)
  })
  
  output$airbnb_graph <- renderPlot({
    airbnb_numbers <- ggplot(data = neighborhoods_df,
                             aes(x = neighborhoods_df$Var1, y = neighborhoods_df$Freq)) + 
                             geom_bar(stat = 'identity', fill = "darkblue") + 
                             theme(axis.text.x = element_text(angle = 60, hjust = 1)) + 
                             labs(x = 'Neighborhood', y = 'Count')
    return(airbnb_numbers)
  })
}

