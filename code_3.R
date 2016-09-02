
setwd("~/Documents/Matt_test")
library(EBImage)

coor_1 <- read.csv("corner_raw.csv")
        
tidy_image <- function(file_input, file_output){
        # print(file_input)
        img <- readImage(file_input)
        img.a <- imageData(img)

        x <- as.vector(as.matrix(coor_1[1, ]))
        img.a.crop <- img.a[x[1]: x[2], x[3]: x[4]]
        
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
opfile <- file.path(opfolder, list.files(ipfolder))


x <- 1
pb <- txtProgressBar(min = 0, max = length(ipfile), style = 3)

for (i in 1:length(ipfile)){
        options(warn=-1)
        
        # print(ipfile[i])
        # print(opfile[i])
        tidy_image(ipfile[i], opfile[i])
        x <- x + 1
        setTxtProgressBar(pb, x)
        
        options(warn=0)

}
