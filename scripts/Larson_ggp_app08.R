#Author: Doug Larson
#Date: 3/1/2022
#Title: Lab 8

rm(list=ls());                     
options(show.error.locations = TRUE);  
library(package=ggplot2);  
library(package=gridExtra);

weatherData = read.csv(file="data/Lansing2016NOAA.csv", 
                       stringsAsFactors = FALSE);

rainyDays = grep(weatherData$weatherType, pattern="RA");  
FoggyDays = grep(weatherData$weatherType, pattern = "FG")
snowyDays = grep(weatherData$weatherType, pattern = "SN")
hazyDays = grep(weatherData$weatherType, pattern = "HZ");
hazyNotRainy = setdiff(hazyDays, rainyDays);
HazyorRainy = union(hazyDays, rainyDays);
notHazyorRainy =  setdiff(1:nrow(weatherData), HazyorRainy);
FoggyandSnowy = intersect(FoggyDays, snowyDays);

####Single Weather Condition####
plot1mean = round(mean(weatherData[hazyDays,]$tempDept), digits = 3)
plot2mean = round(mean(weatherData[FoggyDays,]$tempDept), digits = 3)
plot3mean = round(mean(weatherData[snowyDays,]$tempDept), digits = 3)

plot1 = ggplot(data=weatherData[hazyDays,]) +
  geom_histogram(mapping=aes(x=tempDept), 
                 bins = 20, 
                 color="red4", 
                 fill = "gold") +
  geom_vline(xintercept=plot1mean, size=1.5, color="red") +
  annotate(geom="text",
           x=1.2, 
           y=8,
           label=plot1mean,
           color = "red") +
  theme_classic() +
  labs(title = "Departure of Temperature from Historic Average on Hazy Days",
       subtitle = "Lansing, Michigan: 2016",
       x = "Temperature Departure (°F)",
       y = "Counts");
plot(plot1);

plot2 = ggplot(data=weatherData[FoggyDays,]) +
  geom_histogram(mapping=aes(x=tempDept), 
                 bins = 20, 
                 color="white", 
                 fill = "darkgreen") +
  geom_vline(xintercept=plot2mean, size=1.5, color="red") +
  annotate(geom="text",
           x=4, 
           y=8,
           label=plot2mean,
           color = "red") +
  theme_classic() +
  labs(title = "Departure of Temperature from Historic Average on Foggy Days",
       subtitle = "Lansing, Michigan: 2016",
       x = "Temperature Departure (°F)",
       y = "Counts");
plot(plot2);

plot3 = ggplot(data=weatherData[snowyDays,]) +
  geom_histogram(mapping=aes(x=tempDept), 
                 bins = 20, 
                 color="blue", 
                 fill = "yellow") +
  geom_vline(xintercept=plot3mean, size=1.5, color="red") +
  annotate(geom="text",
           x=-2.5, 
           y=8,
           label=plot3mean,
           color = "red") +
  theme_classic() +
  labs(title = "Departure of Temperature from Historic Average on Snowy Days",
       subtitle = "Lansing, Michigan: 2016",
       x = "Temperature Departure (°F)",
       y = "Counts");
plot(plot3);

#### 2 Weather Conditions (intersect) ####
plot4mean = round(mean(weatherData[FoggyandSnowy,]$tempDept), digits = 3)

plot4 = ggplot(data=weatherData[FoggyandSnowy,]) +
  geom_histogram(mapping=aes(x=tempDept), 
                 bins = 10, 
                 color="Black", 
                 fill = "grey70") +
  geom_vline(xintercept=plot4mean, size=1.5, color="red") +
  annotate(geom="text",
           x=-3.5, 
           y=8,
           label=plot4mean,
           color = "red") +
  theme_classic() +
  labs(title = "Departure of Temperature from Historic Average on Foggy and Snowy Days",
       subtitle = "Lansing, Michigan: 2016",
       x = "Temperature Departure (°F)",
       y = "Counts");
plot(plot4)

#### One of Two Weather Conditions (union) ####
plot5mean = round(mean(weatherData[HazyorRainy,]$tempDept), digits = 3)

plot5 = ggplot(data=weatherData[HazyorRainy,]) +
  geom_histogram(mapping=aes(x=tempDept), 
                 bins = 15, 
                 color="Black", 
                 fill = "purple") +
  geom_vline(xintercept=plot5mean, size=1.5, color="red") +
  annotate(geom="text",
           x=5.8, 
           y=27,
           label=plot5mean,
           color = "red") +
  theme_classic() +
  labs(title = "Departure of Temperature from Historic Average on Hazy or Rainy Days",
       subtitle = "Lansing, Michigan: 2016",
       x = "Temperature Departure (°F)",
       y = "Counts");
plot(plot5)

#### 1 Canvas ####

multi1=arrangeGrob(plot1, plot2, plot3, plot4, plot5,
                   nrow=2);
plot(multi1);

#### Resized on 1 Canvas ###

multi2=arrangeGrob(plot1, plot3, plot5,
                   layout_matrix = rbind(c(1,1,5),
                                         c(1,1,NA),
                                         c(NA,3,3),
                                         c(NA,3,3)));
plot(multi2)
