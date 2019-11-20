library(shiny)
library(dplyr)
library(leaflet)
library(shinydashboard)
library(rgdal)
library(DT)

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

ui <- dashboardPage(
  skin = "blue",
  dashboardHeader(title = "Seattle Safe Airbnb"),
  dashboardSidebar(
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
                step = 1)
  ),
  dashboardBody(
    fluidRow(box(width = 12, leafletOutput(outputId = "mymap"))),
    fluidRow(box(width = 12, tableOutput(outputId = "seattle_data")))
  )
)

