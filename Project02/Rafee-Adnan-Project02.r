myDF <- read.csv("/anvil/projects/tdm/data/flights/1987.csv", stringsAsFactors = TRUE)
head(myDF)

ncol(myDF)

tail(myDF)

typeof(myDF)

myDF2 <- myDF$MONTH
head(myDF2)

tail(myDF2)

typeof(myDF2)

myDFyears <- myDF$YEAR
myDFyears[345:421]

myDFcities <- myDF$DEST_CITY_NAME
myDFcities[894]

myDFdist <- myDF[myDF$DISTANCE < 200, ]
dist <- myDFdist$DISTANCE
sum(complete.cases(dist))

numbers <- c(1:10)
numbers

letters <- c('a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k')
letters]

mixup <- c(numbers, letters)
mixup

month<- myDF$MONTH
hist(month)

dotchart(myDF$MONTH, labels = myDF$MONTH, pch = 21, bg = "green", pt.cex = 1.5)

plot(month)