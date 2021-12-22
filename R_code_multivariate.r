# R_code_multivar.r

# install.packages("vegan")
library(vegan)

# Linux
setwd("~/lab/")

load("biomes_multivar.RData")
ls()

# plot per species matrix
biomes

multivar <- decorana(biomes)
multivar

plot(multivar)

# biomes names in the graph:
attach(biomes_types)
ordiellipse(multivar, type, col=c("black","red","green","blue"), kind = "ehull", lwd=3)
ordispider(multivar, type, col=c("black","red","green","blue"), label = T) 

pdf("multivar.pdf")
plot(multivar)
ordiellipse(multivar, type, col=c("black","red","green","blue"), kind = "ehull", lwd=3)
ordispider(multivar, type, col=c("black","red","green","blue"), label = T) 
dev.off()
