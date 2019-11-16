library(shiny)

intro_page <- tabPanel(
    "Introduction",
    h1("How Seattle Crime Rates Affect Your Decision To Book An Airbnb"),
    fluidPage(
        actionButton('nselect', "Select Neighborhood"),
        actionButton('cselect', "View Crime Rates"),
        actionButton('rselect', "View Airbnb Ratings")
    )

)
br <- tags$br()
about_us <- tabPanel(
    "About Us",
    fluidPage(
        h1("Allison Bennet, Nick Hebert, Tushar Poddar, Mariella Gauvreau"),
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
    
)

background <- tabPanel(
    "Background",
    
)

findings <- tabPanel(
    "Findings",
    
)
neighborhood <- tabPanel(
    "Select by Neighborhood",
    value = 'neighborhood'
)
crime_rates <- tabPanel(
    "Select by Crime Rates",
    value = 'crime_rates'
)
ratings <- tabPanel(
    "Select by Rating",
    value = 'ratings'
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
}

shinyApp(ui, server)