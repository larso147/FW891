rm(list=ls());                         # clear the Environment tab
options(show.error.locations = TRUE);  # show line numbers on error
library(package=ggplot2);              # include all GGPlot2 functions

weatherData = read.csv(file="data/Lansing2016NOAA.csv");

#### Part 1: Create a scatterplot ####
plot1 = ggplot( data=weatherData ) +
  geom_point( mapping=aes(x=avgTemp, y=relHum) );
plot(plot1);

#### Part 2: Same scatterplot without argument names ####
plot2 = ggplot( weatherData ) +
  geom_point( aes(avgTemp, relHum) );
plot(plot2);

#plot(plotData)   # no argument name here
#plot(x=plotData) # x is the argument name

plot3 = ggplot( data=weatherData ) +
  geom_point( mapping=aes(x=avgTemp, y=relHum) ) +
  labs( title="Humidity vs Temperature",
        subtitle="Lansing, MI -- 2016",
        x = "Average Temperatures (Fahrenheit)",
        y = "Relative Humidity") +
  scale_x_continuous( breaks = seq(from=10, to=80, by=10) ) +
  theme( axis.text.x=element_text(angle=90, vjust=0.5) );
plot(plot3);

#### Part 4: Changing the theme ####
plot5 = ggplot( data=weatherData ) +
  geom_point( mapping=aes(x=avgTemp, y=relHum) ) +
  labs( title="Humidity vs Temperature",
        subtitle="Lansing, MI -- 2016",
        x = "Average Temperatures (Fahrenheit)",
        y = "Relative Humidity") +
  scale_x_continuous( breaks = seq(from=10, to=80, by=10) ) +
  theme_bw() +
  theme( axis.text.x=element_text(angle=90, vjust=0.5) );
plot(plot5);



#Looking at the GGPlot cheat sheet (or the GGPlot functions page) from section 4, answer the following:
  
 # What component (function) would be used to create a text plot?
             #geom_text()
  # What component would you use to change the breaks on the x-axis if the values were in date format?
             #scale_date()


#10.1 - Questions to answer
#Answer the following in comments inside your application script:
  
  #What was your level of comfort with the lesson/application?
    #10/10 comfort level. These are all things I've done before. 

  #What areas of the lesson/application confused or still confuses you?
    #For the most part, this lesson is intuitive - I will note, I did not know the theme_bw() had to be listed
    #before the element text changes, so that was a need find for me - thanks for that. 
  #What are some things you would like to know more about that is related to, but not covered in, this lesson?
    # I'm interested in learning ways to visualize multivariate data from a GLM/GLMM/ect

