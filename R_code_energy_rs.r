# R code for estimating energy in ecosystems

# install.packages("raster")
# install.packages("rgdal")

library(raster)
library(rgdal)

# Set the working directory
setwd("~/lab/") # Linux 
# setwd("C:/lab/")  # windows
# setwd("/Users/name/lab/") # mac

# importing the data
l1992 <- brick("defor1_.jpg") # image of 1992
l1992 

# Bands: defor1_.1, defor1_.2, defor1_.3 
# plotRGB
plotRGB(l1992, r=1, g=2, b=3, stretch="Lin")

# defor1_.1 = NIR
# defor1_.2 = red
# defor1_.3 = green

plotRGB(l1992, r=2, g=1, b=3, stretch="Lin")
plotRGB(l1992, r=2, g=3, b=1, stretch="Lin")





