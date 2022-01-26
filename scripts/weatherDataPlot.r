{
  rm(list=ls());                         # clear Console Window
  options(show.error.locations = TRUE);  # show line numbers on error
  library(package=ggplot2);              # include all GGPlot2 functions

  # The name of the data file is lesson01.csv
  # The relative location of the data file is data/ (i.e., the folder data)
  weatherData = read.csv(file="data/LansingWeather2016.csv");

  #### Labels for the facets of the plot
  windLabels = c(Low = "Light Winds",
                 Medium = "Medium Winds",
                 High = "Strong Winds");

  ### Order windSpeedLevel by level -- otherwise it'll be ordered alphabetically
  weatherData$windSpeedLevel = factor(weatherData$windSpeedLevel,
                                      levels=c("Low", "Medium", "High"));

  #### Boxplots of Change in Temperature vs. Wind Direction
  #           at different wind speeds
  tempWinDirPlot = ggplot(data=weatherData) +
    geom_boxplot(mapping=aes(x=windDir, y=changeMaxTemp),
                 na.rm=TRUE) +
    theme_bw() +
    facet_grid(facets=.~windSpeedLevel,
               labeller=as_labeller(windLabels)) +
    scale_x_discrete(limits=c("North", "East", "South", "West")) +
    labs(title = "Change in Temperature vs. Wind Direction",
         subtitle = "Lansing, Michigan: 2016",
         x = "Wind Direction",
         y = "Degrees (Fahrenheit)");
  plot(tempWinDirPlot);

  ### Get basic statistics regarding change in temperature on windy days
  windyDaysSouth = which(weatherData$windSpeedLevel == "High" &
                         weatherData$windDir == "South");
  windyDaysNorth = which(weatherData$windSpeedLevel == "High" &
                           weatherData$windDir == "North");
  changeTempSouth = weatherData$changeMaxTemp[windyDaysSouth];
  changeTempNorth = weatherData$changeMaxTemp[windyDaysNorth];


  ### Output basic information to the Console
  cat(sep="", "In Lansing, Michigan, there were ", length(changeTempNorth),
      " days with strong winds from the north and ", length(changeTempSouth),
      " days with strong winds for the south.\n\n");

  cat(sep="", "The average change in temperature for days with strong winds",
      " from the north was: ", round(mean(changeTempNorth), digits=1),
      "\U00b0", "F +/- ", round(sd(changeTempNorth), digits=1), "\U00b0",
      "F\n\n");

  cat(sep="", "The average change in temperature for days with strong winds",
      " from the south was: ", round(mean(changeTempSouth), digits=1),
      "\U00b0", "F +/- ", round(sd(changeTempSouth), digits=1), "\U00b0",
      "F\n");
}
