rm(list=ls());                         # clear Environment tab
options(show.error.locations = TRUE);  # show line numbers on error
library(package=ggplot2);              # get the GGPlot package

# read in CSV file and save the content to weatherData
weatherData = read.csv(file="data/Lansing2016NOAA.csv", 
                       stringsAsFactors = FALSE);

#### Part 1: Last lesson's plot ####
plot1 = ggplot( data=weatherData ) +
  geom_point( mapping=aes(x=avgTemp, y=relHum) ) +
  labs( title="Humidity vs Temperature",
        subtitle="Lansing, MI -- 2016",
        x = "Average Temperatures (Fahrenheit)",
        y = "Relative Humidity") +
  scale_x_continuous( breaks = seq(from=10, to=80, by=10) ) +
  theme_bw() +
  theme( axis.text.x=element_text(angle=90, vjust=0.5) );
plot(plot1);

#### Part 3: adding color to represent season ####
plot3 = ggplot( data=weatherData ) +
  geom_point( mapping=aes(x=avgTemp, y=relHum, color=season) ) +
  labs( title="Humidity vs Temperature",
        subtitle="Lansing, MI -- 2016",
        x = "Average Temperatures (Fahrenheit)",
        y = "Relative Humidity") +
  scale_x_continuous( breaks = seq(from=10, to=80, by=10) ) +
  theme_bw() +
  theme( axis.text.x=element_text(angle=90, vjust=0.5) );
plot(plot3);

#### Part 3b: adding color to represent precip2 ####
plot3b = ggplot( data=weatherData ) +
  geom_point( mapping=aes(x=avgTemp, y=relHum, color=precip2) ) +
  labs( title="Humidity vs Temperature",
        subtitle="Lansing, MI -- 2016",
        x = "Average Temperatures (Fahrenheit)",
        y = "Relative Humidity") +
  scale_x_continuous( breaks = seq(from=10, to=80, by=10) ) +
  theme_bw() +
  theme( axis.text.x=element_text(angle=90, vjust=0.5) );
plot(plot3b);

#### Part 4: adding size to represent precipitation ####
plot4 = ggplot( data=weatherData ) +
  geom_point( mapping=aes(x=avgTemp, y=relHum, size=precip2) ) +
  labs( title="Humidity vs Temperature",
        subtitle="Lansing, MI -- 2016",
        x = "Average Temperatures (Fahrenheit)",
        y = "Relative Humidity") +
  scale_x_continuous( breaks = seq(from=10, to=80, by=10) ) +
  theme_bw() +
  theme( axis.text.x=element_text(angle=90, vjust=0.5) );
plot(plot4);

#### Part 4b: adding size to represent precipitation ####
plot4b = ggplot( data=weatherData ) +
  geom_point( mapping=aes(x=avgTemp, y=relHum, size=season) ) +
  labs( title="Humidity vs Temperature",
        subtitle="Lansing, MI -- 2016",
        x = "Average Temperatures (Fahrenheit)",
        y = "Relative Humidity") +
  scale_x_continuous( breaks = seq(from=10, to=80, by=10) ) +
  theme_bw() +
  theme( axis.text.x=element_text(angle=90, vjust=0.5) );
plot(plot4b);

plot4c = ggplot( data=weatherData ) +
  geom_point( mapping=aes(x=avgTemp, y=relHum, alpha=precip2) ) +
  labs( title="Humidity vs Temperature",
        subtitle="Lansing, MI -- 2016",
        x = "Average Temperatures (Fahrenheit)",
        y = "Relative Humidity") +
  scale_x_continuous( breaks = seq(from=10, to=80, by=10) ) +
  theme_bw() +
  theme( axis.text.x=element_text(angle=90, vjust=0.5) );
plot(plot4c);

plot5 = ggplot( data=weatherData ) +
  geom_point( mapping=aes(x=avgTemp, y=relHum, alpha=precip2) ) +
  labs( title="Humidity vs Temperature",
        subtitle="Lansing, MI -- 2016",
        x = "Average Temperatures (Fahrenheit)",
        y = "Relative Humidity",
        alpha = "Precipitation") +
  scale_x_continuous( breaks = seq(from=10, to=80, by=10) ) +
  theme_bw() +
  theme( axis.text.x=element_text(angle=90, vjust=0.5),
         legend.position = c(0.15, 0.2));  # x=0.15, y=0.2
plot(plot5);

plot6 = ggplot( data=weatherData ) +
  geom_point( mapping=aes(x=avgTemp, y=relHum, size=precip2, color=season) ) +
  labs( title="Humidity vs Temperature",
        subtitle="Lansing, MI -- 2016",
        x = "Average Temperatures (Fahrenheit)",
        y = "Relative Humidity",
        size = "Precipitation",
        color = "Seasons") +    # changes order
  scale_x_continuous( breaks = seq(from=10, to=80, by=10) ) +
  theme_bw() +
  theme( axis.text.x=element_text(angle=90, vjust=0.5) ,
         legend.position = "left");
plot(plot6);


#### Part 7: adding a linear model ####
plot7 = ggplot( data=weatherData ) +
  geom_point( mapping=aes(x=avgTemp, y=relHum, size=precip2, color=season) ) +
  geom_smooth( mapping=aes(x=avgTemp, y=relHum), 
               method="lm" ) +
  labs( title="Humidity vs Temperature",
        subtitle="Lansing, MI -- 2016",
        x = "Average Temperatures (Fahrenheit)",
        y = "Relative Humidity",
        size = "Precipitation",
        color = "Seasons") +    # changes order
  scale_x_continuous( breaks = seq(from=10, to=80, by=10) ) +
  theme_bw() +
  theme( axis.text.x=element_text(angle=90, vjust=0.5) ,
         legend.position = "none");  # get rid of legend
plot(plot7);

#### Part 8: overlapping plots ####
plot8 = ggplot( data=weatherData ) +
  geom_smooth( mapping=aes(x=avgTemp, y=relHum), 
               method="lm" ) +
  geom_point( mapping=aes(x=avgTemp, y=relHum, size=precip2, color=season) ) +
  labs( title="Humidity vs Temperature",
        subtitle="Lansing, MI -- 2016",
        x = "Average Temperatures (Fahrenheit)",
        y = "Relative Humidity",
        size = "Precipitation",
        color = "Seasons") +    # changes order
  scale_x_continuous( breaks = seq(from=10, to=80, by=10) ) +
  theme_bw() +
  theme( axis.text.x=element_text(angle=90, vjust=0.5) ,
         legend.position = "none");
plot(plot8);

#### Part 10: Application ####
#### Section A ####

plot9 = ggplot( data=weatherData ) +
  geom_smooth( mapping=aes(x=avgTemp, y=relHum, color=season), 
               method="lm" ) +
  geom_point( mapping=aes(x=avgTemp, y=relHum, size=precip2, color=season) ) +
  labs( title="Humidity vs Temperature",
        subtitle="Lansing, MI -- 2016",
        x = "Average Temperatures (Fahrenheit)",
        y = "Relative Humidity",
        size = "Precipitation",
        color = "Seasons") +    # changes order
  scale_x_continuous( breaks = seq(from=10, to=80, by=10) ) +
  theme_bw() +
  theme( axis.text.x=element_text(angle=90, vjust=0.5) ,
         legend.position = "left");
plot(plot9);

####Comment - Explain what happens to the plot when you add the mapping color=season to the linear model
#When we add a color mapping to the linear model, instead of one linear model for all data, we get 
#a linear model for each of the four seasons. 

#### Add Linetype ####
plot10 = ggplot( data=weatherData ) +
  geom_smooth( mapping=aes(x=avgTemp, y=relHum, linetype=season), 
               method="lm" ) +
  geom_point( mapping=aes(x=avgTemp, y=relHum, size=precip2, color=season) ) +
  labs( title="Humidity vs Temperature",
        subtitle="Lansing, MI -- 2016",
        x = "Average Temperatures (Fahrenheit)",
        y = "Relative Humidity",
        size = "Precipitation",
        color = "Seasons") +    # changes order
  scale_x_continuous( breaks = seq(from=10, to=80, by=10) ) +
  theme_bw() +
  theme( axis.text.x=element_text(angle=90, vjust=0.5) ,
         legend.position = "left");
plot(plot10);

#### Section B ####

plot11 = ggplot( data = weatherData) + 
  geom_smooth( mapping=aes(x=windSpeed, y=tempDept), 
               method="lm" ) +
  geom_point( mapping=aes(x=windSpeed, y=tempDept, size=precip2, color=windDir) ) +
  labs( title="Wind Speed vs Temperature Deviation",
        subtitle="Lansing, MI -- 2016",
        x = "Wind Speed (MPH)",
        y = "Temperature Deviation (°C)",
        size = "Precipitation",
        color = "Wind Direction") +   
  scale_x_continuous( breaks = seq(from=0, to=30, by=5) ) +
  scale_y_continuous( breaks = seq(from=-20, to=30, by=5) ) +
  theme_classic() +
  theme( axis.text.x=element_text(angle=90, vjust=0.5) ,
         legend.position = c(0.9, 0.3) );
plot(plot11)

#### comment - What patterns can you find in the plot? 

# There seems to be a slightly positive relationship between winds speed deviation in temperature. Wind 
#direction doesn't seem to affect temperature deviation as each direction appears as a scattershot
# on the graph. It's also not clear that precipitation really affects temperature deviation, as
# there is no noticeable directionality to the increased shape sizes. 

#### Section C ####

plot12 = ggplot( data = weatherData) + 
  geom_point( mapping=aes(x=windSpeed, y=tempDept, size=precip2, color=windDir, shape=season) ) +
  labs( title="Wind Speed vs Temperature Deviation",
        subtitle="Lansing, MI -- 2016",
        x = "Wind Speed (MPH)",
        y = "Temperature Deviation (°C)",
        size = "Precipitation",
        color = "Wind Direction") +   
  scale_x_continuous( breaks = seq(from=0, to=30, by=5) ) +
  scale_y_continuous( breaks = seq(from=-20, to=30, by=5) ) +
  theme_classic() +
  theme( axis.text.x=element_text(angle=90, vjust=0.5) ,
         legend.position = c(0.9, 0.5) );
plot(plot12)

#Answer the following in comments inside your application script:
  
 #1. What was your level of comfort with the lesson/application?
    #I thought this lesson was fairly simple, though the open ended chart in 10B threw me a bit. 

 #2. Approximately how long did you work on this lesson?
    #30 minutes

 #3. What areas of the lesson/application confused or still confuses you?
    #Nothing really confused me. I'm just adjusting to the coding style. It's intuitive, but no one likes change!

 #4. What are some things you would like to know more about that is related to, but not covered in, this lesson?
    #Again, I found this lesson pretty helpful. I'd never used alpha or shapes as a mapping element before. 
    #Really, I want to just keep expanding ggplot skills. I didn't know that you could stacking elements, nor
    #that the order matters, so continuing to build on that would be nice. 
