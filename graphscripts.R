library(dplyr)
library(tidyr)
library(ggplot2)
library(maps)
library(mapproj)
library(ggmap)
library(DeducerSpatial)
seattle_crime <- read.csv("data/Seattle_Police_Department_911_Incident_Response.csv")
airbnb_data <- read.csv("data/listings.csv")
THEFT_data <- filter(seattle_crime, seattle_crime$Event.Clearance.SubGroup == 'THEFT')
states <- map_data('state')
dim(states)
map_wash <- subset(states, region %in% c('washington'))
washington_plot <- ggplot(data = map_wash) +
  geom_polygon(aes(x = long, y = lat, group = group), fill = 'palegreen') + coord_fixed(1.3) 
washington_plot + geom_point(data = THEFT_data, mapping = aes(x = Longitude, y = Latitude, group = NULL)) + 
  labs(title = "Theft Reports in Seattle")
  #scale_x_continuous(limits = c(-123, -121), expand = c(0, 0)) +
  #scale_y_continuous(limits = c(47, 48), expand = c(0, 0))

 neighborhoods_df <- as.data.frame(table(airbnb_data$neighbourhood_group_cleansed))
 
 neighborhood_plot <- ggplot(data = neighborhoods_df, aes(x = neighborhoods_df$Var1, y = neighborhoods_df$Freq)) + 
   geom_bar(stat = 'identity') + theme(axis.text.x = element_text(angle = 60, hjust = 1)) + labs(title = 'The Number of Airbnbs by Neighborhood in Seattle', x = 'Neighborhood', y = 'count')
 neighborhood_plot
 
 
 
 SeattleMap <- qmap(location = 'seattle', )
   
##  D. Kahle and H. Wickham. ggmap: Spatial Visualization with ggplot2. The R Journal,
##   5(1), 144-161. URL http://journal.r-project.org/archive/2013-1/kahle-wickham.pdf
 
   