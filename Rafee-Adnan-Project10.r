options(jupyter.rich_display = F)
options(repr.matrix.max.cols=25, repr.matrix.max.rows=200)
library(data.table)
users <- fread("/anvil/projects/tdm/data/okcupid/filtered/users.csv")
questions <- fread("/anvil/projects/tdm/data/okcupid/filtered/questions.csv")
dim(users)
dim(questions)
head(users)
head(questions)
grep("Google", questions$text)
questions[2172, ]
#shortcut
questions[grep("Google", questions$text), ]
#shortcut
questions$text[grepl("Google", questions$text)]
dim(users)
head(users)
which(names(users) == "q170849")
users[ , 1193]
table(users[[1193]], useNA = "always")
prop.table(table(users[[1193]], useNA = "always"))
tapply(users[[1193]], users[[2282]], table, useNA = "always")
tapply(users[[1193]], users[[2282]], function(x) {prop.table(table(x, useNA = "always"))})
sapply(tapply(users[[1193]], users[[2282]], table, useNA = "always"), prop.table)
table(gsub("_[A-Za-z]*", "", users$gender_orientation), useNA = "always")