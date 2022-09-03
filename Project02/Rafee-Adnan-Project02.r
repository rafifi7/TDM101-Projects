myDF <- read.csv("/anvil/projects/tdm/data/flights/subset/1995.csv", stringsAsFactors = TRUE)
head(myDF)

dim(myDF)

str(myDF)

myairports <- myDF$Origin
str(myairports)

table(head(myairports, 250))["ORD"]

table(myairports)["ORD"]

table(myairports)["IND"]

table(myDF$Dest)["IND"]

myDF[894,]

length(myDF$Distance[myDF$Distance < 200])

airlines <- table(myDF$UniqueCarrier)
tail(sort(airlines), n = 10)

tail(sort(airlines), n = 3)

head(sort(table(myDF$UniqueCarrier), decreasing = TRUE), n=10)

myMonth<- head(sort(table(myDF$Month)),n = 12)
dotchart(myMonth, pch = 21, bg = "green", pt.cex = 1.5)



