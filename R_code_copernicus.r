# R code for uploading and visualizing Coprnicus data in R

# install.packages("ncdf4")
library(ncdf4)
library(raster)

# Set the working directory
setwd("~/lab/copernicus/") # Linux 
# setwd("C:/lab//copernicus/")  # windows
# setwd("/Users/name/lab/copernicus/") # mac

snow20211214 <- raster("c_gls_SCE_202112140000_NHEMI_VIIRS_V1.0.1.nc")

snow20211214

plot(snow20211214)

cl <- colorRampPalette(c('dark blue','blue','light'))(100) # 
plot(snow20211214, col=cl)








