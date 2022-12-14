options(jupyter.rich_display = F)
options(repr.matrix.max.cols=25, repr.matrix.max.rows=200)
eventsDF <- read.csv("/anvil/projects/tdm/data/olympics/athlete_events.csv")
head(eventsDF)
table(eventsDF$Year)
table(eventsDF$NOC)
sort(table(eventsDF$NOC), decreasing = TRUE)
mean(eventsDF$Height, na.rm = TRUE)
sort(tapply(eventsDF$Height, eventsDF$NOC, mean, na.rm = TRUE), decreasing = TRUE)
sort(tapply(eventsDF$Age, eventsDF$NOC, max, na.rm = TRUE), decreasing = TRUE)
sort(tapply(eventsDF$Weight, eventsDF$NOC, sum, na.rm = TRUE), decreasing = TRUE)
drDF <- read.csv("/anvil/projects/tdm/data/death_records/DeathRecords.csv")
head(drDF)
str(drDF)
drDF$Weekdays <- (factor(drDF$DayOfWeekOfDeath, levels = c(1:7,9), labels = c("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Unknown")))
head(drDF)
head(drDF$DayOfWeekOfDeath)
table(drDF$Weekdays)
tapply(drDF$Age, drDF$Sex, mean, na.rm = TRUE)
drFDF <- subset(drDF, drDF$Sex == "F")
drMDF <- subset(drDF, drDF$Sex == "M")
table(drFDF$MaritalStatus)
table(drMDF$MaritalStatus)
tapply(drDF$MaritalStatus, drDF$Sex, table)
head(eventsDF)
height <- (eventsDF$Height)
weight <- (eventsDF$Weight)
plot(height, weight)
head(drDF)
barplot(table(factor(drDF$MonthOfDeath, levels = c(1:12), labels = c("January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"))))
