# make sure to set working directory to where the files are stored
setwd("~/projects/104-group-project/") # this may not work for your system

# Install required packages
install.packages('ggplot2')
install.packages('dplyr')
install.packages('lubridate')
install.packages('readr') # Installing/compiling this package may take some time

# Load packages
library(ggplot2)
library(dplyr)
library(lubridate)

# Import data
nydata <- read.csv("./data/merged.csv")

# View raw data
View(nydata)

# Plot graph
# PLAN - plot this data as a scatter and overlay with a map
