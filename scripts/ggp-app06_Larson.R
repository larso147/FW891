#Author: Doug Larson
#Date: 2/15/2022
#Title: Lab 6

rm(list=ls());                     
options(show.error.locations = TRUE);  
library(package=ggplot2);              

weatherData = read.csv(file="data/Lansing2016NOAA.csv", 
                       stringsAsFactors = FALSE);

#### Part 1 - Scatter Plot ####
windSpeedOrdered = factor(weatherData$windSpeedLevel,
                          levels=c("High", "Medium", "Low"));

weatherData$windSpeedOrdered = windSpeedOrdered;


windDirOrdered = factor(weatherData$windDir,
                          levels=c("North", "South", "East", "West"));

weatherData$windDirOrdered = windDirOrdered;


plot1 = ggplot( data=weatherData ) +
  geom_point( mapping=aes(x=avgTemp, y=relHum)) +  
  theme_bw() +
  facet_grid( rows = vars(windSpeedOrdered), cols = vars(windDirOrdered) ) +  
  labs(title = "Average Temperature vs Relative Humidity",
       subtitle = "Lansing, Michigan: 2016",
       x = "Temperature (\u00B0F)", 
       y = "Relative Humidity (\u0025)");     
plot(plot1);


#### Part 2 ####
seasonOrdered = factor(weatherData$season,
                       levels=c("Spring", "Summer", "Fall", "Winter"));
weatherData$seasonOrdered = seasonOrdered;


plot2 = ggplot( data=weatherData ) +
  geom_histogram( mapping=aes(x=avgTemp, fill = seasonOrdered),
                  color="black",
                  bins = 15) + 
  scale_x_continuous(0,90,breaks = c(5,15,25,35,45,55,65,75,85)) +
  facet_grid( rows = vars(seasonOrdered) ) +
  labs(title = "Temperature (\u00B0F)",
       subtitle = "Lansing, Michigan: 2016",
       x = "Temperature (\u00B0F)",
       fill = "Season")+
  scale_fill_manual(values=c("Spring" = "green",
                             "Summer" = "red",  
                             "Fall" = "orange", 
                             "Winter" = "purple") ) +
  theme_bw() +
  theme(strip.background = element_rect(fill="red", color = "black", size = 2),
        strip.text = element_text(color = 'white', size = 18, family = "serif"));
plot(plot2);


#### Part 3 ####
windSpeedLevelOrdered = factor(weatherData$windSpeedLevel,
                       levels=c("Low", "Medium", "High"));
weatherData$windSpeedLevelOrdered = windSpeedLevelOrdered;

windDirOrdered = factor(weatherData$windDir,
                        levels=c("North", "East", "South", "West"));
weatherData$windDirOrdered = windDirOrdered 


boxColors = c("brown", "brown", "brown", "brown",
              "brown", "brown", "brown", "brown",
              "blue", "blue", "blue", "brown");

boxfill = c("lightyellow", "grey70", "lightyellow", "grey70",
            "lightyellow", "grey70", "lightyellow", "grey70",
            "lightyellow", "grey70", "lightyellow", "grey70")

plot3 = ggplot(data=weatherData) +
  geom_boxplot(mapping=aes(x=windDirOrdered, y=changeMaxTemp),
               na.rm = TRUE, 
               color = boxColors,
               fill = boxfill,
               outlier.size = 3,
               outlier.color = rgb(red=0.7, green = 0.3, blue = 0), 
               outlier.shape ="\u0026") +
  theme_bw() +
  facet_grid( cols=vars(windSpeedLevelOrdered)) +
  labs(title = "Change in Temperature as a function of Wind Direction",
       subtitle = "Lansing, Michigan: 2016",
       x = "Wind Direction",
       y = "Degrees (Fahrenheit)");
plot(plot3);

#### Part 4 - Hiding the Outliers. 

# Option 1 (RGB) - Change the RGB so that the outliers are white -  outlier.color = rgb(red=1, green = 1, blue = 1)
# Option 2 (outlier size) - set outlier sizer to 0. outlier.size = 0
# Option 3 (outlier alpha) - make the outliers completely transparent - outlier.alpha = 0

#### Questions ####

#Answer the following in comments inside your application script:
  
  # What was your level of comfort with the lesson/application?
      # It took me some time to get through, but I was farily comfortable
      # and only had to "google" the changes to the facet background. 
  # Approximately how long did you work on this lesson?
      # 1.5 hours
  # What areas of the lesson/application confused or still confuses you?
      #Nothing confuses me
  # What are some things you would like to know more about that is related to, but not covered in, this lesson?
      #Can you run individual lm using geom_smooth in each facet grid? 



