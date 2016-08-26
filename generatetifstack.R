library(EBImage)

generatetifstack <- function(dir_input, dir_output, output.file.name){
        filename <- list.files(dir_input)
        dir <- file.path(dir_input, filename[1])
        img <- readImage(dir)
        dim.stack <- c(dim(imageData(img)), length(filename))
        
        x <- 1
        img.data <- c()
        for(i in filename){
                dir <- file.path(dir_input, i)
                img <- readImage(dir)
                img.a.temp <- imageData(img)
                img.data <- c(img.data, img.a.temp)
                print(x)
                x <- x + 1
        }
        
        a <- array(img.data, dim = dim.stack)
        
        image_stack <- Image(a)
        output.file.dir <- file.path(dir_output, output.file.name)
        writeImage(image_stack, output.file.dir, "tiff")
        
}



