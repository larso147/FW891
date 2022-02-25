# Author: Doug Larson
# Date: 2/17/2022
# Lesson 7 - Annotations

rm(list=ls());                        
options(show.error.locations = TRUE); 
library(package=ggplot2);            
library(package=ggforce);              

weatherData = read.csv(file="data/Lansing2016NOAA.csv", 
                       stringsAsFactors = FALSE);  

#### Part 1 ####
windDirOrdered = factor(weatherData$windDir,
                        levels=c("North", "East", "South", "West"));

plot1 = ggplot(data=weatherData) +
  geom_boxplot(mapping=aes(x=windDirOrdered, y=changeMaxTemp),
               na.rm = TRUE) +
  theme_bw() +
  labs(title = "Change in Temperature vs. Wind Direction",
       subtitle = "Lansing, Michigan: 2016",
       x = "Wind Direction",
       y = "Change in Temperature (\u00B0F)");
plot(plot1);


fillpoints = c("red", "green", "blue");
xvector = c(2,2,2);
yvector = c(-22,20,25);

plot2 = plot1 +
  annotate(geom="rect",   
           xmin = c(1.8, 1.8, 1.8),    
           xmax = c(2.2, 2.2, 2.2),    
           ymin = c(-24,18,23),    
           ymax = c(-20,22,27),   
           linetype=1,
           color = "black",
           fill = "black");
plot(plot2);

plot3 = plot2 + 
    annotate(geom="point",
           x = xvector,
           y = yvector,
           size = 3,
           color = "black", 
           fill = fillpoints,
           shape = 21);
plot(plot3);  


plot4 = plot3 +
  annotate(geom="text",  
           x=c(1.9, 2.1, 1.9),        
           y=c(-22,20,25),        
           label=c(-22,20,25),   
           color=c("red", "green", "blue"));
plot(plot4);

#### Part 2 ####

plot5 = ggplot() +
  theme_bw() +
  annotate(geom="point",
           x = weatherData$avgTemp[1:100], 
           y = weatherData$relHum[1:100],  
           size = 2,
           color = "red4",
           fill = "gold",
           shape = 24) + 
  labs(title="Average Temperature vs Relative Humidity First 100 Days",
       subtitle = "Lansing, Michigan: 2016",
       x = "Average Temperature (°F)",
       y = "Relative Humidity (%)");
plot(plot5);

humMedian = median(weatherData$relHum[1:100]);
tempMedian = median(weatherData$avgTemp[1:100]);

plot6 = plot5 + 
  geom_vline(mapping=aes(xintercept = tempMedian),
             color = "red4",
             size= 1) +
  geom_hline(mapping=aes(yintercept = humMedian),
             color="gold",
             size=1);
plot(plot6); 

plot7 = plot6 +
  annotate(geom="polygon",  # connects all the points
           x = c(21,21,8,7,8),
           y = c(86,55,60,65,80),
           color = "red4",
           fill = "gold",
           linetype = 1,
           alpha = 0.4);
plot(plot7);

plot8 = plot7 + 
  geom_ellipse(mapping=aes(x0 = 43, y0 = 92, a = 15, b=9, angle=-45),
               alpha=0.2,   
               color = "gold",
               fill = "red4",
               size=1,
               linetype=1);
plot(plot8);

#### Part 3 #### 

xvec2 = seq(1,1000)
yvec2 = sqrt(xvec2)

plot9 = ggplot() +
           theme_bw() +
           annotate(geom="line",
              x =xvec2, 
              y = yvec2,
              color = "gold",
              size=2,
              arrow = arrow()) 
plot(plot9)
           
