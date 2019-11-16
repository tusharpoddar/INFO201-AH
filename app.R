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

about_us <- tabPanel(
    "About Us",
    
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

# Define UI ----
ui <- navbarPage(
    "Crime and Airbinb",
    intro_page,
    about_us,
    about_the_tech,
    background,
    findings
    
)

# Define server logic ----
server <- function(input, output) {
}

shinyApp(ui, server)