library(shiny)

intro_page <- tabPanel(
    "Introduction",
    h1("How Seattle Crime Rates Affect Your Decision To Book An Airbnb"),
    fluidPage(
        # Server is handling the button actions
        actionButton('nselect', "Select Neighborhood"),
        actionButton('cselect', "View Crime Rates"),
        actionButton('rselect', "View Airbnb Ratings")
    )

)
br <- tags$br()
about_us <- tabPanel(
    "About Us",
    fluidPage(
        h1("Meet the Team!"),
        br,
    
        h2("Allison"),
        p("photo"),
        p("description"),
        br,
        h2("Nick"),
        p("photo"),
        p("description"),
        br,
        h2("Tushar"),
        p("photo"),
        p("description"),
        br,
        h2("Mariella"),
        p("photo"),
        p("description"),
        br
        
    )
)

about_the_tech <- tabPanel(
    "About the Tech",
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
      to book Airbnbs in Seattle.")
)

background <- tabPanel(
    "Background",
    h1("Our Project"),
    br,
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
    br,
    h1("Research Questions"),
    p("1) Are people less likely to book an Airbnb if there is high crime activity in the location of the house?"),
    p("2) Is there less crime activity is locations with more Airbnb houses on the market?"),
    actionButton('gotofindings', 'Go To Findings Page'),
    br,
    br
)

findings <- tabPanel(
    "Findings",
    value = 'findings'
    
)

# ------------- These Tabs contain the Visuals and important stuff -------------

neighborhood <- tabPanel(
    "Select by Neighborhood",
    value = 'neighborhood',
    fluidPage(            
        p("test")
    ) #end of splitLayout
)
crime_rates <- tabPanel(
    "Select by Crime Rates",
    value = 'crime_rates',
    fluidPage(            
        p("test")
    ) #end of splitLayout
)
ratings <- tabPanel(
    "Select by Rating",
    value = 'ratings',
    fluidPage(
        p("test")
    ) #end of splitLayout
)

# Define UI ----
ui <- navbarPage(
    "Crime and Airbinb",
    id = "toptabs",
    intro_page,
    about_us,
    about_the_tech,
    background,
    findings,
    neighborhood,
    crime_rates,
    ratings
)

# Define server logic ----


server <- function(input, output, session) {
    observeEvent(eventExpr = input$nselect, {
        updateTabsetPanel(session, 'toptabs', selected = 'neighborhood')
    })
    observeEvent(eventExpr = input$cselect, {
        updateTabsetPanel(session, 'toptabs', selected = 'crime_rates')
    })
    observeEvent(eventExpr = input$rselect, {
        updateTabsetPanel(session, 'toptabs', selected = 'ratings')
    })
    observeEvent(eventExpr = input$gotofindings, {
        updateTabsetPanel(session, 'toptabs', selected = 'findings')
    })
}

shinyApp(ui, server)