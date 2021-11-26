# R code for chemical cycling study
# time series of NO2 change in Europe during the lockdown

library(raster)

# Set the working directory
setwd("~/lab/en/") # Linux 
# setwd("C:/lab/en/")  # windows
# setwd("/Users/name/lab/en/") # mac

en01 <- raster("EN_0001.png")
# what is the range of the data?
# https://www.google.com/search?q=R+colours+names&tbm=isch&ved=2ahUKEwiF-77Z1bX0AhULtKQKHQ3WDWYQ2-cCegQIABAA&oq=R+colours+names&gs_lcp=CgNpbWcQAzIECAAQEzoHCCMQ7wMQJzoICAAQCBAeEBNQiQhYnwxgwg1oAHAAeACAAUqIAZYDkgEBNpgBAKABAaoBC2d3cy13aXotaW1nwAEB&sclient=img&ei=vKKgYYWtOovokgWNrLewBg&bih=526&biw=1056#imgrc=OtMzJfyT_OwIiM
cl <- colorRampPalette(c('red','orange','yellow'))(100) # 

# plot the NO2 values of January 29020 by the cl palette
plot(en01, col=cl)

# Exercise: import the end of March NO2 and plot it
en13 <- raster("EN_0013.png")
plot(en13, col=cl)

# Build a multiframe window with 2 rows and 1 column with the par function






