#Author: Doug Larson
#Date: 2/24/2022
#In Class Exercise 


rm(list=ls());                         
options(show.error.locations = TRUE);  
library(package=ggplot2);             
library(package=ggforce); 


######  Group 1: ##############################################
# - Redo HW 7 #1 using the 4 different methods of using data
# - save as Class7.R
# - Come up with questions
###############################################################

weatherData = read.csv(file="data/Lansing2016NOAA.csv");

windDirOrdered = factor(weatherData$windDir,
                        levels=c("North", "East", "South", "West"));

weatherData$windDirOrdred = windDirOrdered


fillpoints = c("red", "green", "blue");
xvector = c(2,2,2);
yvector = c(-22,20,25);

#### Method 1 ####

plot1 = ggplot(data=weatherData) +
  geom_boxplot(mapping=aes(x=windDirOrdered, y=changeMaxTemp),
               na.rm = TRUE) +
  theme_bw() +
  labs(title = "Change in Temperature vs. Wind Direction",
       subtitle = "Lansing, Michigan: 2016",
       x = "Wind Direction",
       y = "Change in Temperature (\u00B0F)")+
  annotate(geom="rect",   
           xmin = c(1.8, 1.8, 1.8),    
           xmax = c(2.2, 2.2, 2.2),    
           ymin = c(-24,18,23),    
           ymax = c(-20,22,27),   
           linetype=1,
           color = "black",
           fill = "black") + 
  annotate(geom="point",
           x = xvector,
           y = yvector,
           size = 3,
           color = "black", 
           fill = fillpoints,
           shape = 21) +
  annotate(geom="text",  
           x=c(1.9, 2.1, 1.9),        
           y=c(-22,20,25),        
           label=c(-22,20,25),   
           color=c("red", "green", "blue"));
plot(plot1);

#### Method 2 ####

plot2 = ggplot(data=weatherData, mapping=aes(x=windDirOrdered, y=changeMaxTemp),
               na.rm = TRUE) +
  geom_boxplot() +
  theme_bw() +
  labs(title = "Change in Temperature vs. Wind Direction",
       subtitle = "Lansing, Michigan: 2016",
       x = "Wind Direction",
       y = "Change in Temperature (\u00B0F)")+
  annotate(geom="rect",   
           xmin = c(1.8, 1.8, 1.8),    
           xmax = c(2.2, 2.2, 2.2),    
           ymin = c(-24,18,23),    
           ymax = c(-20,22,27),   
           linetype=1,
           color = "black",
           fill = "black") + 
  annotate(geom="point",
           x = xvector,
           y = yvector,
           size = 3,
           color = "black", 
           fill = fillpoints,
           shape = 21) +
  annotate(geom="text",  
           x=c(1.9, 2.1, 1.9),        
           y=c(-22,20,25),        
           label=c(-22,20,25),   
           color=c("red", "green", "blue"));
plot(plot2);

#### Method 3 #### Same as method 1, because we didn't have multiple objects

plot3 = ggplot() +
  geom_boxplot(data=weatherData, mapping=aes(x=windDirOrdered, y=changeMaxTemp),
               na.rm = TRUE) +
  theme_bw() +
  labs(title = "Change in Temperature vs. Wind Direction",
       subtitle = "Lansing, Michigan: 2016",
       x = "Wind Direction",
       y = "Change in Temperature (\u00B0F)")+
  annotate(geom="rect",   
           xmin = c(1.8, 1.8, 1.8),    
           xmax = c(2.2, 2.2, 2.2),    
           ymin = c(-24,18,23),    
           ymax = c(-20,22,27),   
           linetype=1,
           color = "black",
           fill = "black") + 
  annotate(geom="point",
           x = xvector,
           y = yvector,
           size = 3,
           color = "black", 
           fill = fillpoints,
           shape = 21) +
  annotate(geom="text",  
           x=c(1.9, 2.1, 1.9),        
           y=c(-22,20,25),        
           label=c(-22,20,25),   
           color=c("red", "green", "blue"));
plot(plot3);

#### Method 4 ####

plot4 = ggplot() +
  geom_boxplot(mapping=aes(x=windDirOrdered, y=weatherData$changeMaxTemp),
               na.rm = TRUE) +
  theme_bw() +
  labs(title = "Change in Temperature vs. Wind Direction",
       subtitle = "Lansing, Michigan: 2016",
       x = "Wind Direction",
       y = "Change in Temperature (\u00B0F)")+
  annotate(geom="rect",   
           xmin = c(1.8, 1.8, 1.8),    
           xmax = c(2.2, 2.2, 2.2),    
           ymin = c(-24,18,23),    
           ymax = c(-20,22,27),   
           linetype=1,
           color = "black",
           fill = "black") + 
  annotate(geom="point",
           x = xvector,
           y = yvector,
           size = 3,
           color = "black", 
           fill = fillpoints,
           shape = 21) +
  annotate(geom="text",  
           x=c(1.9, 2.1, 1.9),        
           y=c(-22,20,25),        
           label=c(-22,20,25),   
           color=c("red", "green", "blue"));
plot(plot4);

######  Group 2: ##############################################
# - Continue working in the script file Class7.R X
# - create a scatterplot of pressure vs humidity x
# - facet_wrap two other variables to create between 9 and 30 plots x
#    - hint: https://ggplot2.tidyverse.org/reference/vars.html
#    - change either the number of rows or columns in the facet_wrap
#    - hint: https://ggplot2.tidyverse.org/reference/facet_wrap.html
#    - modify one other argument (aside from rows and columns) in facet_wrap 
#    - explain what the other argument does in comments
# - facet_grid the same two variable for the same scatterplot
###############################################################

##Test Fix

dateFormatted = as.Date(weatherData$dateYr, "%Y-%m-%d");
monthAbb = format(dateFormatted, "%b");  
weatherData$month = monthAbb;   

plot5 = ggplot(data=weatherData) +
  theme_bw() +
  geom_point(mapping=aes(x=stnPressure, y=relHum)) +
  geom_smooth(mapping=aes(x=stnPressure, y=relHum),
              method = "lm",
              fill = "red") + 
  facet_wrap(facets = vars(windSpeedLevel, windDir), 
             nrow = 2,
             ncol = 6, 
             switch = "x");  
plot(plot5);

plot6 = ggplot(data=weatherData) +
  theme_bw() +
  geom_point(mapping=aes(x=stnPressure, y=relHum)) +
  geom_smooth(mapping=aes(x=stnPressure, y=relHum),
              method = "lm",
              fill = "red") + 
  facet_grid(rows = vars(windSpeedLevel),
             cols = vars(windDir) );
plot(plot6)

# I chose to use the "switch" argument. the switch argument changes the position of the labels. By default, 
# labels are on the top. By using the argument switch = "x", I moved the labels to the bottom of each facet.
