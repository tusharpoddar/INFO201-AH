# Seattle Safe Airbnb
## How Seattle Crime Rates Affect a User's Decision to Book an Airbnb
Allison J Bennett, Nick M Hebert, Tushar Poddar, Mariella Gauvreau

Info-201: Technical Foundations of Informatics  
The Information School  
University of Washington  
Autumn 2019

#### 1.0 Introduction
  **1.1** Problem Situation.  
  Airbnb currently has over 150 million users worldwide, many of them booking in metropolitan areas like New York, Washington D.C, and Seattle. Every person booking through Airbnb wants to make the most of their vacation by finding a place to stay that meets all of their preferences and financial needs. Sometimes this means finding a place to stay with an optimal location to tourist attractions. This comes with safety risks in largely populated areas. It is important for users to know all of these safety risks when booking to ensure the quality of customer care given by Airbnb.

  **1.2** What is the problem?  
  Airbnb users need to be informed of the crime rates in the locations in which they are looking to stay. They are susceptible to choosing a place to stay that is filled with crime without this information which may lead them to unforeseen danger. Because crime rates are higher in big cities, especially in areas where many tourist attractions are located, this becomes particularly relevant to Airbnb users.

  **1.3** Why does it matter?  
  The growth of Airbnb since the company has first launched is astounding. As more people book with Airbnb, they need to be able to compare listings based on as much information as possible. The quality of someone's experience when booking with Airbnb is determined by their entire vacation, not just by their experience with booking. A vacation can turn unsafe if a person and their family are faced with crime. There is an ethical responsibility for these individuals to be as informed as possible about this possible crime so that they can be better prepared during their stay.

  **1.4** How it will be addressed?  
  This problem will be addressed by creating a hub of information about Airbnb listings. At first, this will only include listings in Seattle and what the crime rates are in each listing's particular location. We will potentially include some other information about the listing’s location, like the proximity to popular attractions. This will allow users of Airbnb to have as much information as possible when booking so that they can weigh their options about which listing to book, potentially keeping them out of harms way during their travels.

#### 2.0 Research Questions
  **Research Question 1**  
  Are people less likely to book an Airbnb if there is high crime activity in the location of the house?  
  **Research Question 2**  
  Is there less crime activity is locations with more Airbnb houses on the market?

#### 3.0 The data sets  
  **Data Set 1**
  *Name:* Seattle Police Department 911 Incident Response  
  *Link:* https://www.kaggle.com/sohier/seattle-police-department-911-incident-response  
  *Number of Observations:* 1.4 million responses from 2009 onward  
  *Number of Attributes:* 19 different attributes  
  *Description:* This dataset is a record of all the police responses to 911 calls made in Seattle, Washington. This study looks at the incident location and type. This data will be used to see where there is a large amount of criminal activity in the Seattle region.

  **Data Set 2**
  *Name:* Seattle Airbnb Open data  
  *Link:* https://www.kaggle.com/airbnb/seattle/  
  *Number of Observations:* Over 1 million observations  
  *Number of Attributes:* 92 different attributes  
  *Description:* This dataset is a record of Airbnb activity in the Seattle region. The dataset includes information on listings, the score of the listing, reviews, location, price, listing id, etc. This data will be used to see popular locations in Seattle for Airbnb houses.

#### 4.0 Information Visualizations  

#### Figure 1.
This visualization demonstrates the amount of crime that occurs in the Seattle area. We would like to make this easier to view up close and look at specific neighborhoods.
![wash_plot](pics/wash_plot.png)

#### Figure 2.
This plot shows the number of Airbnbs in Seattle by neighborhood. Our goal is to make this graph easier to read and add some color or other visual elements to make it easier to interpret.
![airbnb_plot](pics/airbnb_plot.png)

#### 5.0 Technical description of Shiny application  
We have created our Shiny application with the framework of a Navigation panel on the left hand side and Visualizations/Data/Descriptions on the right hand side. The data is in the form of .csv has been loaded into RStudio using the read.csv() function. The major libraries used were: dplyr, rgdal, DT, leaflet, shiny, shinydashboard. We organized our code by creating a ui.R file and a server.R file, defining the ui and server sections in different documents. We are attempting to determine the safest locations for people to book Airbnbs in Seattle.

#### 6.0 Conclusion  
Our shiny application is an interactive map that allows users to select a range of home prices and see the location of homes in that area. The project we created has many strengths. It is easy to use and visually appealing to users looking to learn more about Airbnbs in Seattle. There are also some things we wish to improve on our shiny application. Currently, our application takes the Airbnb data set and displays Airbnb houses on our interactive map based on some user input. Since this is the "first" submission of our shiny application, for our final project submission, we plan on including the Seattle Police Department 911 Incident Report data set. Including this data will allow users to not only see Airbnbs in Seattle but also crime rate in that area as well. Future implications of this project can be looking at Airbnb and crime rates in other parts of the country, not just Seattle.  
The main lesson learned from this project is that there is lots of data around us. It is our job to find this data and give meaning to it.
A note about our project. GitHub would not allow us to upload our CSV files for our datasets because they are over 300 MB. We have provided the links. You must 'click' on the link and download the CSV file before running our shiny application.  

#### Acknowledgements
Yash was very helpful. He not only provided insightful feedback about our project, but he also helped fix bugs and problems found in our Shiny application.

#### References
https://muchneeded.com/airbnb-statistics/  
https://ipropertymanagement.com/airbnb-statistics/

#### Appendix 1: Data Dictionary  
Variable Name | Description | Data Type | Measurement Type  
--- | --- | --- | ---
**Data Set:** Seattle Police Department 911 Incident Response
Incident Location | This variable describes the longitude and latitude coordinates of the incident  | Quantitative/Numerical Data | Interval
Initial Type Description | This variable describes the type of incident that was reported from a 911 call | Qualitative/Categorical data | Ordinal
**Data Set:** Seattle Airbnb Open data
latitude | This variable describes the latitude of the Airbnb house | Quantitative/Numerical Data | Interval
longitude | This variable describes the longitude of the Airbnb house | Quantitative/Numerical Data | Interval
available | This variable describes whether or not the Airbnb house is available to rent or if it is currently occupied | Qualitative/Categorical data | Dichotomous
listing_id | This variable describes 'listing' (Airbnb house) as a numerical value | Quantitative/Numerical Data | Interval

#### Appendix 2: Reflections  
**Allison's Reflection:** This project helped me learn a lot about working as a team, specifically when using GitHub. Making sure communication is clear and watching out for merge errors and new commits is vital to making the team work. I was kind of frustrated with figuring out how to incorporate multiple data sets into one visualization. It was also difficult to look at and make sense of another person’s code. In the future, I would probably spend a little more time working on the design, but we will be able to improve that with the final deliverable. This project helped me develop my identity as an Innovator and Thinker as I worked with the problem and why it mattered and outlined the way we could represent our data. I am hoping to develop my Coder identity more in the last part of this project.  
**Mariella's Reflection:** From this project, I learned many things. One thing that I learned was how to work on code with a group. We successfully created a GitHub repository in which we used to share code. I learned how to analyze and manipulate data using R. I also learned the basics of creating a Shiny application. One of the hardest things about working in a group is learning how to effectively communicate. Throughout this project, I learned that communication is important when you are pushing/pulling code and in the very beginning when you are delegating tasks to each member. This project helped me develop my identity as an Innovator and Thinker. While I enjoyed learning about the code for this project, I enjoyed analyzing our data and looking at the overall purpose of our project. In the future I hope to focus on developing my coding skills.    
**Nick's Reflection:** I learned how to create a basic Shiny application and implement R code into the application. I found the action buttons to be extremely confusing at first, and it took me a while to understand how they worked and how to assign a function to them in the server section of the app.R file. I found it satisfying that Shiny makes it easy to create the UI in a clean manor. It is also easy to create something basic very quickly. In the future, I’ll probably research the easiest or best ways to create a Shiny application, instead of just looking at the functions and comparing the way the change the UI. This project has made me do the big think on how to code, and how to a client-side UI interacts with a server.  
**Tushar's Reflection:** Info 201 project helped me learn a lot. It helped me give me an insight about how it is like to be working in a group. I learnt how working on our strengths helps and benefits the group in general. I had a lot of fun learning about the shiny app because it helped me look at my progress as I coded, motivating me even more to work on it and finish it. I got to learn about the possibilities of the shiny app and how it can be used to manipulate data and visualize it. I think that this group was really cooperative and we had a good communication between us which helped us to do everything in a planned order. Hence, I would say that there is nothing that I would like to change how we did and planned things. This project helped me increase my confidence as a coder and a thinker also. Working in groups on such projects is always a fun idea.  

#### Appendix 3: Use of Envisioning Cards  
One of the envisioning cards we decided to focus on was 'Widespread Use'. This card says that a person's use of technology may be impacted by how, when, and where other people are using it. The success of our application is impacted by how often people are using Airbnb to book houses. Those who are using Airbnb will find our application to be very helpful. Those who are not using Airbnb, will not find our application as useful. In this day and age, it is important to understand how people are using other technology and how frequently. Since booking houses online has become very popular, we assumed that our application will be a success. It is important to think about other technologies around you and how users are responding to those when creating your own application.
