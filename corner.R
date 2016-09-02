library(EBImage)

corner <- function(dir_input){
        img <- readImage(dir_input)
        img.a <- imageData(img)
        # display(img.a)
        # print(img.a[1000, ])
        dim <- dim(img.a)
        pos.col.y1 <- c()
        pos.col.y2 <- c()
        for (i in 1:dim[1]){
                p.col <- which(img.a[i, ] > 0)
                pos.col.y1 <- c(pos.col.y1, p.col[1])
                pos.col.y2 <- c(pos.col.y2, tail(p.col, n = 1))
        }
        pos.col.y1 <- pos.col.y1[!is.na(pos.col.y1)]
        pos.col.y2 <- pos.col.y2[!is.na(pos.col.y2)]
        y2 <- max(pos.col.y2)
        y1 <- min(pos.col.y1)
        
        pos.row.x1 <- c()
        pos.row.x2 <- c()
        for (i in 1:dim[2]){
                p.row <- which(img.a[ ,i] > 0)
                pos.row.x1 <- c(pos.row.x1, p.row[1])
                pos.row.x2 <- c(pos.row.x2, tail(p.row, n = 1))
        }
        pos.row.x1 <- pos.row.x1[!is.na(pos.row.x1)]
        pos.row.x2 <- pos.row.x2[!is.na(pos.row.x2)]
        x1 <- min(pos.row.x1)
        x2 <- max(pos.row.x2)
        coor <- c(x1, x2, y1, y2, x2-x1, y2-y1) 
}


