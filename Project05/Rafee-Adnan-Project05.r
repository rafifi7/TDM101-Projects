options(jupyter.rich_display = F)
options(repr.matrix.max.cols = 25, repr.matrix.max.rows = 25)
myDF <- read.csv("/anvil/projects/tdm/data/election/escaped/itcont2020sample.txt", sep="|")
head(myDF)
library(lubridate, warn.conflicts = FALSE)
myDF$newdates <- mdy(myDF$TRANSACTION_DT)
head(myDF$TRANSACTION_DT)
head(myDF$newdates)
sum(myDF$TRANSACTION_AMT)
myResults <- tapply(myDF$TRANSACTION_AMT, myDF$newdates, sum) 
plot(sort(unique(myDF$newdates)), myResults)
newDF <- subset(myDF, newdates >= mdy(1012019) 
                & newdates <= mdy(5152019))
dim(newDF)
dim(myDF)
newResults <- tapply(newDF$TRANSACTION_AMT, newDF$newdates, sum) 
head(newResults)
plot(sort(unique(newDF$newdates)), newResults)
stateDonations <- tapply(myDF$TRANSACTION_AMT, myDF$STATE, sum) 
sum(stateDonations)
myDF$cityState <- paste(myDF$CITY, myDF$STATE, sep = ", ")
head(myDF$cityState)
cityStateDonations <- tapply(myDF$TRANSACTION_AMT, myDF$cityState, sum)
head(sort(cityStateDonations, decreasing = TRUE))
tail(sort(cityStateDonations, decreasing = TRUE))
head(cityStateDonations)
class(myDF$NAME)
splitNames <- sapply(strsplit(myDF$NAME, split = ", "), "[", 2)
myDF$firstName <- splitNames
head(myDF$NAME)
head(myDF$firstName)
sum(myDF$TRANSACTION_AMT[grepl(", MARY ", myDF$NAME)])
notemployed <- sum(myDF$TRANSACTION_AMT[myDF$EMPLOYER == "NOT EMPLOYED"], na.rm = TRUE)
employed <- sum(myDF$TRANSACTION_AMT[myDF$EMPLOYER != "NOT EMPLOYED" & myDF$EMPLOYER != "" & myDF$EMPLOYER != "NONE" ], na.rm = TRUE)
donType <- c(notemployed, employed) 
names(donType) <- c("NOT EMPLOYED", "EMPLOYED")
barplot(donType)
donType
head(sort(tapply(myDF$TRANSACTION_AMT, myDF$OCCUPATION, sum), decreasing=TRUE))
numNotEmployeed <- sum(myDF$EMPLOYER == "NOT EMPLOYED", na.rm = TRUE)
numEmployed <- sum(myDF$EMPLOYER != "NOT EMPLOYED" & myDF$EMPLOYER != "" & myDF$EMPLOYER != "NONE", na.rm = TRUE)
employCount <- c(numNotEmployeed, numEmployed)
names(employCount) <- c("Not Employed", "Employed")
barplot(employCount)
numNotEmployeed
numEmployed
