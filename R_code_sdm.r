# R code for species distribution modelling, namely the distribution of individuals of a population in space

# install.packages("sdm")
# install.packages("rgdal")
# or: install.packages(c("sdm","rgdal"))

library(sdm)
library(raster) # predictors
library(rgdal) # species: an array of x,y points x0,y0, x1y1...

# species data
file <- system.file("external/species.shp", package="sdm")

file

species <- shapefile(file) # exatcly as the raster function for raster files

# how many occurrences are there? Subset a DataFrame
presences <- species[species$Occurrence == 1,]
absences <- species[species$Occurrence == 0,]

# plot!
plot(species, pch=19) 

# plot presences and absences
plot(presences, pch=19, col="blue")
points(absences, pch=19, col="red")

# let's look at the predictors
path <- system.file("external", package="sdm")

lst <- list.files(path, pattern='asc', full.names=T) 

# you can use the lapply function with the raster function but in this case it is not needed since the data are inside the package and they have an asc extension
preds <- stack(lst)

cl <- colorRampPalette(c('blue','orange','red','yellow')) (100)
plot(preds, col=cl) 

plot(preds$elevation, col=cl)
points(presences, pch=19)

plot(preds$temperature, col=cl)
points(presences, pch=19)

plot(preds$vegetation, col=cl)
points(presences, pch=19)

plot(preds$precipitation, col=cl)
points(presences, pch=19)

# day 2
# importing the source script

setwd("~/lab/") # Linux
# setwd("C:/lab/") # Windows
# setwd("/Users/name/Desktop/lab/") # Mac 

source("R_code_source_sdm.r")

# in the theoretical slide of SDMs we should use individuals of a species and predictors 
preds
# these are the predictors: elevation, precipitation, temperature, vegetation 

# Let's explain to the model what are the training and predictors data
datasdm <- sdmData(train=species, predictors=preds)
datasdm

# model
m1 <- sdm(Occurrence~temperature+elevation+precipitation+vegetation, data=datasdm, methods="glm")

# prediction: map probability
p1 <- predict(m1, newdata=preds)

plot(p1, col=cl)
points(presences, pch=19)

# stack everything together
s1 <- stack(preds, p1)
plot(s1, col=cl)

names(s1) <- c('Elevation', 'Precipitation', 'Temperature', 'Vegetation', 'Probability')
plot(s1, col=cl)













