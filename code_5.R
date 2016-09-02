
setwd("~/Documents/Matt_test")
library(EBImage)

sample_image <- function(file_input, file_output, coor_crop){
        # print(file_input)
        img <- readImage(file_input)
        img.a <- imageData(img)
        img.a.crop <- img.a[coor_crop[1]: coor_crop[2], coor_crop[3]: coor_crop[4]]
        writeImage(img.a.crop, file_output, "tiff")
        rm(img)
        rm(img.a)
        rm(img.a.crop)
}

library(tcltk2)
ipfolder <- tk_choose.dir(getwd(), "Choose an input folder")
opfolder <- tk_choose.dir(getwd(), "Choose an output folder")
# op.name <- "image_stack.tif"
# print(ipimg)
# print(opimg)
ipfile <- file.path(ipfolder, list.files(ipfolder))

img <- readImage(ipfile[1])
img.a <- imageData(img)
img.dim <- dim(img.a)

sample_size <- 500 
sample_row <- 2
sample_col <- 4

coor_crop <- data.frame()
for (i in 1:sample_row){
        for(j in 1: sample_col){
                x_interval <- img.dim[1] / sample_col
                print(sample_col)
                print(x_interval)
                x_start <- floor((x_interval / 2)) * j - sample_size / 2
                x_end <- floor((x_interval / 2)) * j + sample_size / 2  
                
                y_interval <- img.dim[2] / sample_row
                y_start <- floor((y_interval / 2)) * i - sample_size / 2
                y_end <- floor((y_interval / 2)) * i + sample_size / 2
                
                coor_crop.temp <- c(x_start, x_end, y_start, y_end)
                coor_crop <- rbind(coor_crop, coor_crop.temp)
        }
        
}

colnames(coor_crop) <- c("x1", "x2", "y1", "y2")
print(coor_crop)
x <- 1
pb <- txtProgressBar(min = 0, max = length(filename), style = 3)

options(warn=-1)
for (i in 1:length(ipfile)){
        for (j in 1:nrow(coor_crop)){
                dir.create(file.path(opfolder, j))
                opfile <- file.path(opfolder, j, list.files(ipfolder))
                coor_crop_temp <- as.vector(coor_crop[j, ], mode='numeric')
                sample_image(ipfile[i], opfile[i], coor_crop_temp)
                x <- x + 1
                setTxtProgressBar(pb, x)
        }

}
options(warn=0)