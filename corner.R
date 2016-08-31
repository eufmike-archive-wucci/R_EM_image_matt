library(EBImage)

corner <- function(dir_input){
        img <- readImage(dir_input)
        img.a <- imageData(img)
        # display(img.a)
        # print(img.a[1000, ])
        dim <- dim(img.a)
        pos.col <- c()
        for (i in 1:dim[1]){
                p.col <- which(img.a[i, ] > 0)
                pos.col <- c(pos.col, tail(p.col, n = 1))
        }
        pos.col <- pos.col[!is.na(pos.col)]
        y <- max(pos.col)
        
        pos.row <- c()
        for (i in 1:3114){
                p.row <- which(img.a[ ,i] > 0)
                pos.row <- c(pos.row, p.row[1])
        }
        pos.row <- pos.row[!is.na(pos.row)]
        x <- min(pos.row)
        coor <- c(x, y) 
}


