library(shiny)
library(dplyr)
library(leaflet)
library(shinydashboard)
library(rgdal)
library(DT)

df <- read.csv("listings.csv", stringsAsFactors = FALSE)
br <- tags$br()
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
    intro_page <- fluidPage(
      fluidRow(box(width = 12, leafletOutput(outputId = "mymap"))),
      fluidRow(box(width = 12, tableOutput(outputId = "seattle_data")))
    ),
    about_us <- fluidPage(
      fluidPage(
        h1("Meet the Team!"),
        img(src="group375.png", align = "center")
        
      )
    ),
    
    about_the_tech <- fluidPage(
      h1("What Technology Was Used To Create This Application?"),
      br,
      p("This application was made using the coding languag R. 
      We have created our application with a framework called Shiny. 
      The app's structure is a Navigation panel on the left hand side and 
      Visualizations/Data/Descriptions on the right hand side. The data is 
      in the form of .csv has been loaded into RStudio using the read.csv() function. 
      The major libraries used were: dplyr, maps, mapproj, leaflet, shiny, tidyr, ggplot2. 
      We organized our code by creating an app.R file and defining the ui and server sections
      within the same document. We are attempting to determine the safest locations for people
      to book Airbnbs in Seattle."),
    ),
    
    background <- fluidPage(
      h1("Our Project"),
      h3("Problem Situation"),
      p("Airbnb currently has over 150 million users worldwide, many of them booking
      in metropolitan areas like New York, Washington D.C, and Seattle. Every person 
      booking through Airbnb wants to make the most of their vacation by finding a place 
      to stay that meets all of their preferences and financial needs. Sometimes this means
      finding a place to stay with an optimal location to tourist attractions. This comes with 
      safety risks in largely populated areas. It is important for users to know all of these 
      safety risks when booking to ensure the quality of customer care given by Airbnb."),
      h3("What is the problem?"),
      p("Airbnb users need to be informed of the crime rates in the locations in which they 
      are looking to stay. They are susceptible to choosing a place to stay that is filled
      with crime without this information which may lead them to unforeseen danger. Because
      crime rates are higher in big cities, especially in areas where many tourist attractions
      are located, this becomes particularly relevant to Airbnb users."),
      h3("Why does it matter?"),
      p("The growth of Airbnb since the company has first launched is astounding. As more people
      book with Airbnb, they need to be able to compare listings based on as much information
      as possible. The quality of someone's experience when booking with Airbnb is determined 
      by their entire vacation, not just by their experience with booking. A vacation can turn 
      unsafe if a person and their family are faced with crime. There is an ethical responsibility 
      for these individuals to be as informed as possible about this possible crime so that they can
      be better prepared during their stay."),
      h3("How it will be addressed?"),
      p("This problem will be addressed by creating a hub of information about Airbnb listings. 
      At first, this will only include listings in Seattle and what the crime rates are in each 
      listing's particular location. We will potentially include some other information about the
      listing’s location, like the proximity to popular attractions. This will allow users of Airbnb
      to have as much information as possible when booking so that they can weigh their options about
      which listing to book, potentially keeping them out of harms way during their travels."),
      h1("Research Questions"),
      p("1) Are people less likely to book an Airbnb if there is high crime activity in the location of the house?"),
      p("2) Is there less crime activity is locations with more Airbnb houses on the market?")
    )

  ) # end of dash body
) # end of ui

