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


# day 2

l2006 <- brick("defor2_.jpg")

l2006 
# plotting the imported image
plotRGB(l2006, r=1, g=2, b=3, stretch="Lin")

# defor1_.1 = NIR
# defor1_.2 = red
# defor1_.3 = green

# par

par(mfrow=c(2,1))
plotRGB(l1992, r=1, g=2, b=3, stretch="Lin")
plotRGB(l2006, r=1, g=2, b=3, stretch="Lin")

# let's calculate energy in 1992
dev.off()
dvi1992 <- l1992$defor1_.1 - l1992$defor1_.2
cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100) # specifying a color scheme
plot(dvi1992, col=cl)

# calculate energy in 2006
dvi2006 <- l2006$defor2_.1 - l2006$defor2_.2
cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100) # specifying a color scheme
plot(dvi2006, col=cl)

# differencing two images of energy in two different times
dvidif <- dvi1992 - dvi2006
# plot the results
cld <- colorRampPalette(c('blue','white','red'))(100) 
plot(dvidif, col=cld)

# final plot: original images, dvis, final dvi difference
par(mfrow=c(3,2))
plotRGB(l1992, r=1, g=2, b=3, stretch="Lin")
plotRGB(l2006, r=1, g=2, b=3, stretch="Lin")
plot(dvi1992, col=cl)
plot(dvi2006, col=cl)
plot(dvidif, col=cld)

pdf("energy.pdf")
par(mfrow=c(3,2))
plotRGB(l1992, r=1, g=2, b=3, stretch="Lin")
plotRGB(l2006, r=1, g=2, b=3, stretch="Lin")
plot(dvi1992, col=cl)
plot(dvi2006, col=cl)
plot(dvidif, col=cld)
dev.off() 

pdf("dvi.pdf")
par(mfrow=c(3,1))
plot(dvi1992, col=cl)
plot(dvi2006, col=cl)
plot(dvidif, col=cld)
dev.off() 





























