setwd("~/Documents/Matt_test")\

coor <- read.csv("corner.csv")
head(coor)
colnames(coor) <- c("z", "x", "y")
coor <- coor[, c(2,3,1)]

head(coor)

library(plotly)
plot_ly(coor, x = x, y = y, z = z, type = "scatter3d", sizemode='diameter')