library(ggplot2)
library(dplyr)
library(tidyr)
library(gridExtra)

coor_1 <- read.csv("corner_crop_aligned.csv")
coor_2 <- read.csv("corner_crop_sample_aligned.csv")

## make plot
plot <- ggplot() +
        geom_line(data = coor_1, aes(delta.x, delta.y))+
        geom_line(data = coor_2, aes(delta.x, delta.y), color = "red")

plot