setwd("~/Documents/Matt_test")
source("R_code/corner.R")

library(tcltk2)
ipimg <- tk_choose.dir(getwd(), "Choose an input folder")

# import the image files
filename <- list.files(ipimg)
dir <- file.path(ipimg, filename)

coor <- data.frame()
# create progress bar
x <- 1
pb <- txtProgressBar(min = 0, max = length(filename), style = 3)
for (i in dir){
        coor.temp <- corner(i)
        coor <- rbind(coor, coor.temp)
        x <- x + 1
        setTxtProgressBar(pb, x)
}
close(pb)
colnames(coor) <- c("x1", "x2", "y1", "y2", "x", "y")

coor.origin <- coor
coor.origin[, "delta.x"] <- coor[, "x1"] - 1 + coor[, "x2"] - coor[, "x"][1]
coor.origin[, "delta.y"] <- coor[, "y1"] - 1 + coor[, "y"][1] - coor[, "y2"]
head(coor.origin, 100)

write.csv(coor.origin, "corner_crop_sample_aligned.csv", row.names=FALSE)

ifelse(nrow(unique(coor)) == 1, "Good to go", "BADDDDDD")