# R_code_quantitative_estimates_land_cover.r

library(raster)
library(RStoolbox) 
library(ggplot2)

setwd("~/lab/") # Linux
# setwd("C:/lab/") # Windows
# setwd("/Users/name/Desktop/lab/") # Mac

# brick
# 1 list the files available
rlist <- list.files(pattern="defor")
rlist
# 2 lapply: apply a function to a list 
list_rast <- lapply(rlist, brick)
list_rast

plot(list_rast[[1]])

# defor: NIR 1, red 2, green 3
plotRGB(list_rast[[1]], r=1, g=2, b=3, stretch="lin")

l1992 <- list_rast[[1]]
plotRGB(l1992, r=1, g=2, b=3, stretch="lin")

l2006 <- list_rast[[2]]
plotRGB(l2006, r=1, g=2, b=3, stretch="lin")

# Unsupervised classification
l1992c <- unsuperClass(l1992, nClasses=2)
l1992c

plot(l1992c$map)
# value 1 = agricultural areas and water
# value 2 = forests

freq(l1992c$map)
#     value  count
#[1,]     1  36664
#[2,]     2 304628

# agricultural areas and water (class 1) = 36664
# forest (class 2) = 304628

total <- 341292
propagri <- 36664/total
propforest <- 304628/total

# agriculture and water: 0.1074271 ~ 0.11
# forest: 0.8925729 ~ 0.89

# build a dataframe
cover <- c("Forest", "Agriculture")
prop1992 <- c(0.8925729, 0.1074271)

proportion1992 <- data.frame(cover, prop1992)

ggplot(proportion1992, aes(x=cover, y=prop1992, color=cover)) + geom_bar(stat="identity", fill="white")



















