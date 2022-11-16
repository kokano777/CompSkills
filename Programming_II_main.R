### BIOL694 Programming_II 
#Author: Kyoko Okano
#Original date: 11/15/2022
#Last updated: 11/16/2022

setwd("C:/Users/kokano/Documents/UAF_PhD/BIOL694/R_programming") # This is my working directory
rm(list = ls()) # Clean environment

#Q2
temp <- read.csv("./temp.csv",skip = 1) #load tenp.csv excluding the first line

#Q7
rad_table<-read.csv("Rad.txt",skip = 43)#load Rad.txt excluding from 1st to 43rd lines.

#Q8
read.rad <-function(x){
  RadQ8 <- read.csv(x, skip = 43)
  output <- (RadQ8)
  return(output)
}
#then run below
RadQ8 = read.rad("./Rad.txt")

## other way ##
read.rad <- function(x = "./Rad.txt"){
  data_Rad2 <- read.csv(file = x, skip = 43)
  return(data_Rad2)
}
read.rad()

# Finding the critical parts
temp <- readLines("./Rad.txt")
grep("S#", temp)

#Q12
read.rad <-function(x){
  RadQ12_L<-readLines(x)
  RadQ12_LN <- grep("S#", RadQ12_L)
  RadQ12 <- read.csv(x, skip = RadQ12_LN-1)
  output <- (RadQ12)
  return(output)
}
Res_Q12 = read.rad("./Rad.txt")


### other way ###
read.rad <- function(x= ""){
  RadQ12_L<-readLines(x)
  RadQ12_LN <- grep("S#", RadQ12_L)
  RadQ12 <- read.csv(x, skip = RadQ12_LN-1)
  output <- (RadQ12)
  return(output)
}
read.rad("./Rad.txt")

# modified
read.rad <- function(file = ""){
  RadQ12_L<-readLines(file)
  RadQ12_LN <- grep("S#", RadQ12_L)
  RadQ12 <- read.csv(file, skip = RadQ12_LN-1)
  output <- (RadQ12)
  return(output)
}
read.rad(file = "./Rad.txt")

### Saving your function
rm(list=ls()) # Remember this clears your Environment
source(file = "Q13_RadFuncrion.R") # Imports your new function
rad_input <- read.rad("./Rad.txt")
