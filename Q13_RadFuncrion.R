# RAD Importing Script
#Author: Kyoko Okano
#Last Update: 11/15/2022

#

###########
read.rad <- function(file = ""){
  RadQ13_L<-readLines(file)
  RadQ13_LN <- grep("S#", RadQ13_L)
  RadQ13 <- read.csv(file, skip = RadQ13_LN-1)
  output <- (RadQ13)
  return(output)
}
