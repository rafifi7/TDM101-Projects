options(jupyter.rich_display = F)
list.files("/anvil/projects/tdm/data/disney")
myDF <- read.csv("/anvil/projects/tdm/data/disney/7_dwarfs_train.csv", stringsAsFactors = TRUE)
file.info("/anvil/projects/tdm/data/disney/7_dwarfs_train.csv")$size
head(myDF, n = 21)
dim(myDF)
head(myDF$SPOSTMIN, n = 50)
str(table(myDF$SPOSTMIN))
summary(myDF$SPOSTMIN)
newDF <- subset(myDF, !is.na(myDF$SPOSTMIN))
head(newDF)
christmas2021 <- myDF$SACTMIN[myDF$date == "12/25/2021"]
mean(christmas2021, na.rm = TRUE)
july26th2021 <- myDF$SACTMIN[myDF$date == "06/26/2021"]
mean(july26th2021, na.rm = TRUE)
head(sort(table(myDF$date), decreasing = TRUE))
length(myDF$SPOSTMIN)
length(newDF$SPOSTMIN)
myhours <- (newDF$SPOSTMIN)/60  + (myDF$SPOSTMIN)/60
length(myhours)
myDF$SPOSTMIN[313997]/60
newDF$SPOSTMIN[313997]/60
myhours[313997]
newDF$SPOSTMIN[1]/60
library(lubridate)
myDF$weekday <- wday(myDF$datetime, label=TRUE)
mean(myDF$SACTMIN[(myDF$weekday == "Mon") & (myDF$SACTMIN != -92918)], na.rm = TRUE)
mean(myDF$SACTMIN[myDF$weekday == "Tue"], na.rm = TRUE)
mean(myDF$SACTMIN[myDF$weekday == "Wed"], na.rm = TRUE)
mean(myDF$SACTMIN[myDF$weekday == "Thu"], na.rm = TRUE)
mean(myDF$SACTMIN[myDF$weekday == "Fri"], na.rm = TRUE)
mean(myDF$SACTMIN[myDF$weekday == "Sat"], na.rm = TRUE)
mean(myDF$SACTMIN[myDF$weekday == "Sun"], na.rm = TRUE)
myresults <- tapply(myDF$SACTMIN[myDF$SACTMIN != -92918], myDF$weekday[myDF$SACTMIN != -92918], mean, na.rm = TRUE)
plot(myresults)
dotchart(myresults)
myDF$Month <- month(myDF$datetime, label=TRUE)
monthresults <- tapply(myDF$SACTMIN[myDF$SACTMIN != -92918], myDF$Month[myDF$SACTMIN != -92918], mean, na.rm = TRUE)
monthresults
plot(monthresults)
dotchart(monthresults)