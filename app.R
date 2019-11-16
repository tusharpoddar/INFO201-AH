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
}

shinyApp(ui, server)