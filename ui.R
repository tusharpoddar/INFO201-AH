library(shiny)
library(dplyr)
library(leaflet)
library(shinydashboard)
library(rgdal)
library(DT)
library(shinythemes)
library(shinyWidgets)

df <- read.csv("listings.csv", stringsAsFactors = FALSE)
crime_df <-read.csv('crime_data.csv')
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

# the ui definiton of the app - how the app looks 
# in all the Panels, the content on each page is in the form of an md file. 
ui <- fluidPage(
  theme = shinytheme("darkly"),
  skin = "blue",
  navbarPage(h4("Seattle Safe Airbnb"),
       tabPanel(h5("About Us"), includeMarkdown("aboutUs.md")),
       tabPanel(h5("Introduction"), includeMarkdown("introduction.md")),
       tabPanel(h5("Running Application"),
         titlePanel(title = "Seattle Safe Airbnb"),
         sidebarPanel(
           selectInput("neighbourhood_input", "Select a neighbourhood", choices = unique(seattle_data$neighbourhood),
                        selected = "Alki"
           ),
           sliderInput("price_input", label = "Price Range $$",
                       0, 500,
                       value = c("$0", "$500"),
                       sep = "",
                       step = 1),
           selectInput("property_type_input", "Room Type", choices = unique(seattle_data$property_type),
                       selected = "Private room"),
           sliderInput("minimum_nights_input", label = "Minimum Nights",
                       0, 500,
                       value = c(0, 500),
                       sep = "",
                       step = 1),
           switchInput('showcrime', label = 'Show Crime', value = FALSE)
         ),
         # code to display the map and the table that we get from the server output
         mainPanel(
           fluidRow(box(width = 12, leafletOutput(outputId = "mymap"))),
           fluidRow(box(width = 12, tableOutput(outputId = "seattle_data")))
         )
       ),
       tabPanel(h5("Visualizations"), includeMarkdown("visualizations.md")), 
       tabPanel(h5("Conclusions"), includeMarkdown("conclusions.md"))
  )
  
)

