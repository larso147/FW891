rm(list=ls());                         # clear the Environment tab
options(show.error.locations = TRUE);  # show line numbers on error
library(package=ggplot2);      

weatherData = read.csv(file="data/Lansing2016NOAA.csv");

my_plot = ggplot( data=weatherData ) +
  geom_point( mapping=aes(x=stnPressure, y=windSpeed) ) +
  labs( title="Station Pressure vs Wind Speed",
        subtitle="Lansing, MI -- 2016",
        x = "Station Pressure Pressure (atm)",
        y = "Wind Speed (mph)") +
  scale_x_continuous( breaks = seq(from=28, to=30, by=0.1) ) +
  scale_y_continuous(limits = c(0,21),
        breaks = seq(from=3, to=21, by=9))+ 
  theme_dark() +
  theme( axis.text.x=element_text(angle=45, vjust=0.5) );
plot(my_plot);

#Questions

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