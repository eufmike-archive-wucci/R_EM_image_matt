
setwd("~/Documents/Matt_test")
source("R_code/generatetifstack.R")

library(tcltk2)
ipimg <- tk_choose.dir(getwd(), "Choose an input folder")
opimg <- tk_choose.dir(getwd(), "Choose an output folder")
op.name <- "image_stack.tif"
print(ipimg)
print(opimg)

generatetifstack(ipimg, opimg, op.name)

