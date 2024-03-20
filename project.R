# make sure to set working directory to where the files are stored
setwd("~/projects/matthew-townson/104-group-project/") # this may not work for your system

# Install required packages
install.packages('ggplot2')
install.packages('dplyr')
install.packages('lubridate')
install.packages('readr') # Installing/compiling this package may take some time
install.packages('rnaturalearth')

# Load packages
library(ggplot2)
library(dplyr)
library(lubridate)

# Import data
nydata <- read.csv("./data/merged.csv")

# making a subset of data that only includes the island of manhattan
nyc <- subset(nydata, (-74.2>=nydata$Lon & nydata$Lon<=-73.5) | (41>=nydata$Lat & nydata$Lat>=40.5) )
# * Filter that didn't work :: nyc <- nyc %>% filter((-74.6>=nydata$Lon & nydata$Lon>=-73) & (41.45>=nydata$Lat & nydata$Lat>=40.55

# View raw data
View(nydata)
View(nyc)

# Plot graph
# PLAN - plot this data as a scatter and overlay with a map
# * OLD plot :: plot(nydata$Lon, nydata$Lat, pch=19, col="black")

# Plots ALL - shows all of the pickups across the state
ggplot(nydata, aes(x=Lon, y=Lat) ) +
    geom_bin2d(bins=10000) +
    scale_fill_continuous(type = "viridis") +
    theme_bw()
ggsave("./exported/full.png", width = 16, height = 9, device="png", dpi=1600)

# Plots only NYC area - do between x(-74.2, -73.5) and y(40.55, 40.94375)
ggplot(nyc, aes(x=Lon, y=Lat) ) +
    geom_bin2d(bins=3000) +
    scale_fill_continuous(type = "viridis") +
    theme_bw()
ggsave("./exported/nyc.png", device="png", dpi=2000)
ggsave("./exported/nyc.png", width = 16, height = 9, device="png", dpi=2000)
