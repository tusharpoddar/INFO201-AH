# About Us
## Team Members
- Allison J Bennett
- Nick M Hebert
- Tushar Poddar
- Mariella Gauvreau

![Group Picture](./pics/group.png)

## About the Tech
One part of our project that required an innovative solution was mapping the crime and the Airbnb listings in the same view. To do this, we started off with the Airbnb locations in longitude and latitude. We then calculated the mean longitude and latitude for all the listings in view. From there, we calculated the minimum and maximum for both the latitude and longitude from this central point, using these distances to create a box around the Airbnb’s. Some adjustments had to be made to ensure that the space around each location was accounted for (space was added when the minimum and maximum difference resulted in a positive number). To complete the area we would use to plot the crimes, we then added a buffer of .01 to the latitude and .005 to the longitude. By doing all of this, we were able to plot both the crime data and the Airbnb data on the same map view.

We wanted users to have as many details as possible when choosing an Airbnb, which is why we included things like maximum and minimum nights and price in our table. These kind of options are also available when the user is looking at the map - they are able to put in the neighborhood, price range, room type, and the minimum number of nights that they are looking for.

Our visualizations offer two views - one to show what crime occurs in which parts of Seattle, the other to show where there are the most Airbnbs located. All of this information is intended to help a user make their decision on where to book an Airbnb. 
