rm(list=ls());                        
options(show.error.locations = TRUE);
library(package=ggplot2);              


weatherData = read.csv(file="data/Lansing2016NOAA.csv", 
                       stringsAsFactors = FALSE);

plot1 = ggplot( data=weatherData ) +
  geom_point( mapping=aes(x=windSpeed, y=minTemp, alpha = maxTemp), #alpha use 1
              color = rgb(red = 0.6, green = 0.2, blue = 0.9),  #RGB use 1, Plot Point modification 1 (Unique Prop 1)
              size = 4, #Plot point modification 2 (Unique Property 2)
              shape = "\U25C6", ) + #Plot point modification 3 (Unique Property 3), unicode 1
  geom_smooth( mapping = aes(x = windSpeed, y=minTemp),
               method = "lm",
               linetype = 5, #plot lines modification 1
               size = 2,     #plot lines modification 2
               color = "red",#plot lines modification 3
               fill = "black" ) + #plot lines modification 4
  labs( title="Wind Speed vs Daily Low Temperature \U1F321", #Unicode 2
        subtitle="Lansing, MI -- 2016",
        x = "Wind Speed (MPH)",
        y = "Daily Low Temperature (\U00B0 F)") + #unicode 3
  scale_x_continuous( breaks = seq(from=0, to=25, by=5) ) +
  scale_y_continuous( breaks = seq(from=0, to=80, by=10) ) +
  theme_bw() +
  theme( panel.grid.minor = element_line (color = "grey50", linetype = 5), #element line modification 1 and 2, greyscale 1
         panel.grid.major = element_line (size = 2, #element line use 3 
         color = rgb(red = 0, green = 0, blue = 0)), #RGB Use 2
         panel.background = element_rect(fill="Grey 80", linetype = 3 ), #Greyscale 2, Element_rec 1 and 2
         plot.background = element_rect(color = rgb(red = 0.0, green = 0, blue = 1), size = 5) )+ #RGB#3, element_rec 3 and 4
  theme( axis.text.x=element_text(angle=90, vjust=0.5, size = 12,
         color = rgb(red = 0.6, green = 0.9, blue = 0.1)) )+ # 4 element text adjustments, RGB use 4
  theme( axis.text.y = element_text(family = "serif", face = "bold",
         hjust = 0.5, colour = "green")); # 4 element text adjustments, 
plot(plot1);

#### Author's note: Do I recognize this is an ugly plot that I would never use? Yes, yes I do. 

#### Plot 2 ####

plot2 = ggplot( data = weatherData) +
  geom_line(mapping = aes(x=1:nrow(weatherData), y=windSusSpeed),
      linetype = 6, #plot line modification 4
      size = 0.5, #plot line modification 5
      color = "deeppink4") + #plot line modification 6
  geom_point(mapping = aes(x=1:nrow(weatherData), y=windPeakSpeed, color=windSpeedLevel), # Plot point modification 4
      shape = "\U1F32C", #plot point modification 5, unicode 5
      size = 1) + #Plot point modification 6
  labs( title="Daily Sustained Wind Speed (MPH) and Daily Peak Wind Speed", 
      subtitle="Lansing, MI -- 2016",
      x = "Day of the Year \U2600", #unicode 6
      y = "Wind Speed (MPH)" ) +
  theme_classic()+
  theme( axis.ticks = element_line(color="red") ) + #element line 4
  theme( legend.background = element_rect(color="Red", fill="grey50", size=0.5) );
        
plot(plot2)  

#NOTE: Rather than writing a paragraph of all my uses, I commented each use to ensure that I used the correct 
#number for each column. See Above. 

#Questions

#1. What was your level of comfort with the lesson/application?

#I got tripped up by the silliest things in this lesson. For example - it's harder than you might think to 
#come up with five uses of unicode. Overall, though - I didn't think this was too tough. I don't do well
#with open ended tasks. I could make better figures of less abstract concepts. I don't know - I'm just 
#not super creative!

#2. What areas of the lesson/application confused or still confuses you?

#Nothing really confuses me. I'm just not good with open ended tasks. 

#3. What is a way you can apply the material in this lesson towards your research or area of study?

#I can totally translate this to my research. It's amazing how incredibly silly I've been about plotting regressions
#before this. I honestly didn't know that it was as simple as using the geom_smooth function. 

#What are some things you would like to learn related to, but not covered in, this lesson?

#It would be interesting to use other packaged which are based in GGPlot, but which expand on its functions.
