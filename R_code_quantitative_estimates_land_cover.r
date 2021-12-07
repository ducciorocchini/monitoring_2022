# R_code_quantitative_estimates_land_cover.r

library(raster)
library(RStoolbox) # we will use this package to make the classification
library(ggplot2) # we will use this package for the ggplot function
# library(gridExtra) # we will use this package for multiframe ggplot
library(patchwork)

setwd("~/lab/") # Linux
# setwd("C:/lab/") # Windows
# setwd("/Users/name/Desktop/lab/") # Mac

# brick
# 1 list the files available
rlist <- list.files(pattern="defor")
rlist
# 2 lapply: apply a function to a list 
list_rast <- lapply(rlist, brick) # lapply(x, FUN)
list_rast

plot(list_rast[[1]])

# defor: NIR 1, red 2, green 3
plotRGB(list_rast[[1]], r=1, g=2, b=3, stretch="lin")

l1992 <- list_rast[[1]]
plotRGB(l1992, r=1, g=2, b=3, stretch="lin")

l2006 <- list_rast[[2]]
plotRGB(l2006, r=1, g=2, b=3, stretch="lin")

# Unsupervised classification
l1992c <- unsuperClass(l1992, nClasses=2) # unsuperClass(x, nClasses) 
l1992c

plot(l1992c$map)
# value 1 = forests 
# value 2 = agricultural areas and water

freq(l1992c$map)
#     value  count
#[1,]     1  306582
#[2,]     2  34710

# forest (class 1) = 306582
# agricultural areas and water (class 2) = 34710

total <- 341292
propagri <- 34710/total
propforest <- 306582/total

# agriculture and water: 0.1017018 ~ 0.10
# forest: 0.8982982 ~ 0.90

# build a dataframe
cover <- c("Forest", "Agriculture")
# prop1992 <- c(0.8982982, 0.1017018)
prop1992 <- c(propforest, propagri)

proportion1992 <- data.frame(cover, prop1992)

ggplot(proportion1992, aes(x=cover, y=prop1992, color=cover)) + geom_bar(stat="identity", fill="white")

# Classification of 2006
# Unsupervised classification
l2006c <- unsuperClass(l2006, nClasses=2) # unsuperClass(x, nClasses) 
l2006c

plot(l2006c$map)
# forest: value 1
# agriculture: value 2

# Frequencies
freq(l2006c$map)

#  value  count
#[1,]     1 179374 # forest
#[2,]     2 163352 # agriculture

# Proportions

total <- 342726
propagri2006 <- 163352/total
propforest2006 <- 179374/total

# build a dataframe
cover <- c("Forest", "Agriculture")
prop1992 <- c(propforest, propagri)
prop2006 <- c(propforest2006, propagri2006)

proportion <- data.frame(cover, prop1992, prop2006)

proportion
ggplot(proportion, aes(x=cover, y=prop2006, color=cover)) + geom_bar(stat="identity", fill="white") + ylim(0,1)
ggplot(proportion, aes(x=cover, y=prop1992, color=cover)) + geom_bar(stat="identity", fill="white") + ylim(0,1)

# plotting altogether

p1 <- ggplot(proportion, aes(x=cover, y=prop1992, color=cover)) + geom_bar(stat="identity", fill="white")
p2 <- ggplot(proportion, aes(x=cover, y=prop2006, color=cover)) + geom_bar(stat="identity", fill="white")

# grid.arrange(p1, p2, nrow=1)
p1+p2







