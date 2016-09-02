library(ggplot2)
library(dplyr)
library(tidyr)
library(gridExtra)

setwd("~/Documents/Matt_test")

coor <- read.csv("corner.csv")
head(coor)
colnames(coor) <- c("z", "x", "y")
coor <- coor[, c(2,3,1)]

head(coor)
## make plot
plot1 <- ggplot(data = coor, aes(x, y)) +
        geom_line()


## delta in x and y 

x <- 1
pb <- txtProgressBar(min = 0, max = (nrow(coor)-1), style = 3)
coor.delta <- data.frame()

for (i in 1: (nrow(coor)-1)){
        coor.delta.temp <- coor[i+1, ] - coor[i, ] 
        coor.delta <- rbind(coor.delta, coor.delta.temp)
        x <- x + 1
        setTxtProgressBar(pb, x)
}

dim(coor)
dim(coor.delta)

plot2 <- ggplot(data = coor.delta, aes(x, y)) +
        geom_line()

grid.arrange(plot1, plot2, ncol=2)

coor.10 <- which(coor.delta[,"y"]>10)
coor.delta[coor.10, ]
