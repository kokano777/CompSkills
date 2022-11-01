
x <- c(1:10) 
x

month.name
summer <- c(month.name[6:8])
summer

rm(list = ls())

typeof(3.14)
typeof(5)
typeof(2i)
typeof(TRUE)
typeof('dog')

x <- c(1:10)
typeof(x)
str(x)
length(x)
x[5:8]
x[-1]
x[-2:-8]

y <- c(11:20)
z <- c(x, y)
z.2 <- c(z, 21)

students <- c("Caitlyn", "Hannah", "Miles", "Gus", "Isaac", "Kyoko", "Amanda", "Alex", "Noelle")

#Q5
temp <- c(5, "red", 10, "blue")


vals <- c(2, 3, 5)
str(vals)
vals <- as.character(vals)
test<-c(z,"Bob")

#Data Frames
cats <- data.frame(coat = c("calico", "black", "tabby"),
                   weight = c(2.1, 5.0, 3.2),
                   likes_string = c(1, 0, 1))
cats
str(cats)

cats$coat
cats$coat[1]
cats$likes_string

#Q9
cats$likes_string =as.logical(cats$likes_string) #change likes_string from numeric to logical
cats$likes_string =as.logical(cats$likes_string)*1 #If I want to keep it 0/1, go back to original.

#Q10
cats$coat
cats[, 1]
cats[1:2, 1]

#Q11
cats[which(cats$coat == "calico"), ]

#Q12
mean(cats$weight)
mean(cats$coat)
str(cats) 


### Matrix
matrix_example <- matrix(0, ncol=6, nrow=3)
matrix_example

#Q13
class(matrix_example)
typeof(matrix_example)
str(matrix_example)
dim(matrix_example)

#Q14
length(matrix_example)# I thought 18 and I was right, 
#Q15
matrix_Q15<- matrix(1:50, ncol=5, nrow=10) #by column because that is the default
matrix_Q15

matrix_Q15_r<- matrix(1:50, ncol=5, nrow=10, byrow = T) #
matrix_Q15_r

#### Alaskan ponds
temp <- c(18, 15, 19, 16, 16, 18)
N <- c(3, 7, 2, 5, 6, 4)
P <- c(0.2, 0.5, 0.3, 0.6, 0.05, 0.1)
survey <- cbind(temp, N, P)
survey
str(survey)
dim(survey)
nrow(survey)
ncol(survey)
is.matrix(survey)


#Q16
mean(survey[,"N"])# This is the Answer or mean(survey[,2])

mean(survey$N) #error
mean(N) #this works
colMeans(survey)
summary(survey)

NtoP <- survey[, "N"] / survey[, "P"]

pond_survey <- as.data.frame(survey)
survey
pond_survey

pond_survey$NtoP <- round(pond_survey$N / pond_survey$P, 2)
pond_survey

####### lists

list_example <- list(title = "Numbers", numbers = 1:10, data = TRUE )
list_example

list_example[[1]]
list_example[[2]][1]

typeof(cats)


####### Loops
for (i in 1:10){
  print(i)
}

mat <- matrix(NA, nrow = 5, ncol = 3)
for (i in 1:nrow(mat)){
  for (j in 1:ncol(mat)){
    mat[i, j] <- i * j
  }
}

#challenge

#example
for (i in 1:nrow(mat)){
  message("i = ", i)
  Sys.sleep(1)
  for (j in 1: ncol(mat)){
    message("j = ", j)
    Sys.sleep(1)
    mat[i, j] <- i * j
  }
}

#example
slow<-vector(length=0)
fast<-rep(NA,1000)

#Data#   Run original
system.time(for (i in 1:nrow(mat)){
  message("i = ", i)
    for (j in 1: ncol(mat)){
    message("j = ", j)
      mat[i, j] <- i * j
  }
})

#test   Ran 
fast <- matrix(NA, nrow =100, ncol = 100)
system.time(for (i in 1:nrow(fast)){
  for (j in 1:ncol(fast)){
    fast[i, j] <- i * j
  }
})

### Fast run 
fast<-rep(NA,1000)
system.time(for (i in 1:1000){
         fast[i] <- rnorm(100)
})
#  user  system elapsed 
#  0.03    0.00    0.03 

#Slow run
slow<-vector(length=0)
system.time(for (i in 1:1000){
  slow[i] <- rnorm(100)
})
#  user  system elapsed 
#  0.05    0.00    0.05 


#Adding histogram?
### Fast
system.time(for (i in 1:1000){
  fast[i] <- rnorm(100)
    hist(fast)
})
#   user  system elapsed 
# 39.50    3.52   43.31 

system.time(for (i in 1:1000){
  slow[i] <- rnorm(100)
  hist(slow)
})
#    user  system elapsed 
#   43.84    3.83   47.95 

##### Mario's demo 11012022
fast<-rep(NA,1000)
system.time(
  for (i in 1:1000){
    fast[i] <- sample (1:100,)
    }
)

slow <-vector(length=0)
system.time(
  for (i in 1:1000){
    slow[i] <- sample (1:100,)
    }
)

#Advanced
Loop = seq (from = 0, to=10^6, by = 10000)
Loop = seq (from = 0, to=10^6, by = 10000)[-1]#exclude the first 0 (originally starting with 0 in [1])
adv = data.frame(Loop = Loop, Time_Fast = rep (NA, length(j)),
                 Time_Slow = rep(NA, length(j)))

for (j in 1: length(Loop)) {
  message(paste0("Loop length = ", Loop[j]))
  fast=rep(NA,j)
  adv$Time_Fast[j] = system.time(
    for (i in 1:Loop[j]) {
      fast[i]=i 
      }
  )[3]
  
  slow <-vector(length=0)
  adv$Time_Slow[j] = system.time(
    for (i in 1:Loop[j]) {
      slow[i]=i
    }
  )[3]
}

plot(x = adv$Loop, y = adv$Time_Slow, type = "l", col = "blue",
     xlab = "Loop Size", ylab = "Time (ms)", las=1)
lines(x = adv$Loop, y = adv$Time_Fast, col="red")
legend("bottomright", legend = c("Slow", "Fast"), fill =c("blue", "red"),
       bty = "n)")