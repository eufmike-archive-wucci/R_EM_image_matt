library(EBImage)

generatetifstack <- function(dir_input, dir_output, output.file.name){
        options(warn=-1)
        
        # import the image files
        filename <- list.files(dir_input)
        dir <- file.path(dir_input, filename[1])
        img <- readImage(dir)
        # extract the dimesion of images
        dim.stack <- c(dim(imageData(img)), length(filename))
        
        # create progress bar
        x <- 1
        pb <- txtProgressBar(min = 0, max = length(filename), style = 3)
        
        print("stacking images into an array......")
        # concatenate image array into a major vector
        img.data <- c()
        for(i in filename){
                dir <- file.path(dir_input, i)
                img <- readImage(dir)
                img.a.temp <- imageData(img)
                img.data <- c(img.data, img.a.temp)
                x <- x + 1
                setTxtProgressBar(pb, x)
        }
        close(pb)
        print("converting the array into an image stack......")
        # convert the major array into an array with desinated dimension
        a <- array(img.data, dim = dim.stack)
        # convert array into the Image format
        image_stack <- Image(a)
        
        # save as tiff
        print("saving the image stack......")
        output.file.dir <- file.path(dir_output, output.file.name)
        writeImage(image_stack, output.file.dir, "tiff")
        
        print("done")
        options(warn = 0)
}



