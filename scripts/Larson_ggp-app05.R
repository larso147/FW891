#Author: Doug Larson
#Date: 2/3/2022
#Title: Larson Lesson 5: Modifying Mapped Elements

rm(list=ls());                         
options(show.error.locations = TRUE);  
library(package=ggplot2);      

weatherData = read.csv(file="data/Lansing2016NOAA.csv", 
                       stringsAsFactors = FALSE);  

#### Part 1 - Temperature vs Humidity ####
seasonOrdered = factor(weatherData$season,
                       levels=c("Spring", "Summer", "Fall", "Winter"));

plot1 = ggplot( data=weatherData ) +
  geom_point( mapping=aes(x=avgTemp, y=relHum, shape=seasonOrdered, fill = seasonOrdered)) +
  geom_smooth( mapping = aes(x=avgTemp, y=relHum, color = seasonOrdered), 
              method = "lm", se=F)+
     theme_bw() +
     labs(title = "Humidity (\u0025) vs. Temperature (\u00B0F)",
       subtitle = "Lansing, Michigan: 2016",
       x = "Temperature (\u00B0F)",  
       y = "Humidity (\u0025)",
       fill = "Seasons",
       color = "Seasons",
       shape = "Seasons") +    
     guides(color = guide_legend(order=1),
         size = guide_legend(order=2)) +   
     scale_x_continuous(limits=c(15,85),
                   breaks = c(30,50,70)) +
     scale_y_continuous(limits=c(40,100),
                     breaks = c(50,70,90)) +
     scale_size(range=c(0,5));
plot(plot1);

plot2 = plot1 + 
       scale_shape_manual(values=c(21,22,23,24))+
       scale_fill_manual(values = c("Summer"="red",
                                    "Spring" = "green",
                                    "Fall" = "yellow", 
                                    "Winter" = "blue"))+
       scale_color_manual(values = c("Summer"="red",
                                     "Spring" = "green",
                                     "Fall" = "yellow", 
                                     "Winter" = "blue")); 
plot(plot2)
  

#### Part 2 = Histogram ####
windSpeedOrdered = factor(weatherData$windSpeedLevel,
                          levels=c("Low", "Medium", "High") );

plot4 = ggplot( data=weatherData ) +
  geom_histogram(mapping = aes(x=relHum, color = windSpeedOrdered), bins = 30, binwidth = 2) +
    labs(title = "Relative Humidity (\U0025)", 
         subtitle = "Lansing, Michigan: 2016",
         x = "Relative Humidity (\U0025)",
         y = "Counts Per Bin",
         color = "Wind Speed") +
  theme_classic()+
  scale_color_manual(values=c("Low" = "green",
                              "Medium" = "yellow",  
                              "High" = "red")); 
plot(plot4)

plot5 = plot4 +
  theme(panel.background = element_rect(fill = "black"))
plot(plot5)

#### Part 3 - Humidity vs Ave Temp ####

plot6 = ggplot( data=weatherData ) +
  geom_point( mapping=aes(x=avgTemp, y=relHum, fill=stnPressure),
              shape=23,
              size=3,
              color="black",
              alpha=0.5) +
  theme_bw() +
  labs(title = "Humidity (\u0025) vs. Average Temperature (\u00B0F)",
       subtitle = "Lansing, Michigan: 2016",
       x = "Average Temperature (\u00B0F)",  
       y = "Humidity (\u0025)",
       color = "Station Pressure")+
  scale_fill_gradientn(colors=c("green", "yellow", "blue"),
                       values=c(0,0.33,1));
plot(plot6)



#Questions
  
#What was your level of comfort with the lesson/application?
  #I made it through this lesson comfortably, though I couldn't use the default shape settings in part 3 to 
  #map the color gradient. Once I decided to change the shape to 23, I was able to use the fill mapping to 
  #fix the issue, but that led to some frustration. 

#Approximately how long did you work on this lesson?
  # A little over an hour

#What areas of the lesson/application confused or still confuses you?
  #I'd like to know why I couldn't set up my plot in part three the same way that you did in the lesson (with the
  #default circle shape)

#What are some things you would like to know more about that is related to, but not covered in, this lesson?
  #I'm all set on this one. It wasn't terribly hard to understand. 