library(package = "sp");       
library(package = "rgeos");   
library(package = "rgdal");    
library(package = "ggplot2");
library(package = "sf");       
library(package = "rnaturalearth");     
library(package = "rnaturalearthdata");

#### Group 1:
#  Using a text editor (RStudio is a text editor):    
#    Create a CSV file that has lat/long for Detroit, Chicago, and Toronto
#  Create a Simple Feature from the file

Cities = st_read(dsn="data/Cities.csv");
Cities_SF1 = st_as_sf(Cities, 
                       coords = c("lng", "lat"));
Cities_SF2 = st_as_sf(Cities, 
                       coords = c("lng", "lat"),
                       crs = 4326); #most common crs in the United States (WGS84)
Cities_SF2

City = c("Detroit", "Chicago", "Toronto")
lng = c(-83.0458, -87.6298, -79.3832)
lat = c(42.3314, 41.8781, 43.6532)
Cities = data.frame(City, lng, lat)

####Group 2
# - Zoom this map into Great Lakes region
# - Use UTM 14N (CRS = 26914)
# - add Canada to the map (from naturalearth.com or using ne_download()
# - add Lake Erie to the map (download from Michigan arcgis)
# - add Detroit, Chicago, Toronto as points to the map
# - Do the same plot with 2 other CRS 

Canada = ne_states(country = "Canada");
Canada_sf = st_as_sf(Canada);

lakeErie = st_read(dsn="data/Lake_Erie_shoreline.kml")
lakeErie_SF = st_as_sf(lakeErie); 

plot1 = ggplot() +
  geom_sf(data = states_SF,
          mapping = aes(geometry = geometry),
          color = "black",
          fill = "grey") +
  
  geom_sf(data = Canada_sf,
          mapping = aes(geometry = geometry),
          color = "black",
          fill = "grey60") + 
  geom_sf(data = lakes_SF,
          mapping = aes(geometry = geometry),
          color = "lightblue",
          fill = "lightblue") +
  geom_sf(data = lakeMI_SF,
          mapping = aes(geometry = geometry),
          color = "blue",
          fill = "blue") + 
  geom_sf(data = lakeErie_SF,
          mapping = aes(geometry = geometry),
          color = "blue",
          fill = "blue")+
  geom_sf(data = Cities_SF2,
          mapping = aes(geometry = geometry),      
          color = "red", 
          fill = "red",
          size = 3, 
          shape = 18);

plot2 = plot1 +
  coord_sf(crs = 26914,  
           xlim = c(1000000, 2500000),  # note the negative number (false easting)
           ylim = c(4300000, 5450000),
           expand = TRUE);
plot(plot2);

###### plot 3 - CRS = 26988 NAD83 / Michigan North #####

plot3 = plot1 +
  coord_sf(crs = 26988,  
           xlim = c(7550000, 8900000),  # note the negative number (false easting)
           ylim = c(-750000, 500000),
           expand = TRUE);
plot(plot3);

##### Plot 4 - CRS = 3592 NAD83 (NSRS2007) - Michigan South #####

plot4 = plot1 +
  coord_sf(crs = 3592,  
           xlim = c(3250000, 4750000),  # note the negative number (false easting)
           ylim = c(-375000, 875000),
           expand = TRUE);
plot(plot4);

