# R code for species distribution modelling, namely the distribution of individuals of a population in space

# install.packages("sdm")
# install.packages("rgdal")

library(sdm)
library(raster) # predictors
library(rgdal) # species

file <- system.file("external/species.shp", package="sdm")

file

species <- shapefile(file) # exatcly as the raster function for raster files

plot(species, pch=19, col="red") 



