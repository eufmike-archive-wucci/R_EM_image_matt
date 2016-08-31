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
print(coor)
colnames(coor) <- c("x", "y")
write.csv(coor, "corner.csv")

