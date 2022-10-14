options(repr.matrix.max.cols=25, repr.matrix.max.rows=200)
options(jupyter.rich_display = F)
library(data.table)
titles <- data.frame(fread("/anvil/projects/tdm/data/movies_and_tv/titles.csv"))
episodes <- data.frame(fread("/anvil/projects/tdm/data/movies_and_tv/episodes.csv"))
people <- data.frame(fread("/anvil/projects/tdm/data/movies_and_tv/people.csv"))
ratings <- data.frame(fread("/anvil/projects/tdm/data/movies_and_tv/ratings.csv"))
head(titles)
diffGenres <- unlist(strsplit(unique(titles$genres), ","))
unique(diffGenres)
tail(sort(table(titles[grepl("Comedy", titles$genres), ]$premiered)))
head(episodes)
dim(episodes)
dim(titles)
epiTitles <- merge(episodes, titles, by.x = "episode_title_id", by.y = "title_id")
head(epiTitles)
noTitleFriendsDF <- epiTitles[epiTitles$show_title_id == "tt0108778", ]
head(noTitleFriendsDF)
friendsDFnoRating <- merge(noTitleFriendsDF, titles, by.x = "show_title_id", by.y = "title_id")
friendsDFrating <- merge(friendsDFnoRating, ratings, by.x = "episode_title_id", by.y = "title_id")
friendsDF <- merge(friendsDFrating, ratings, by.x = "show_title_id", by.y = "title_id")[ , c("primary_title.x", "primary_title.y", "rating.x", "rating.y")]
head(friendsDF)
names(friendsDF) <- c("episode_title", "show_title", "episode_rating", "show_rating")
head(friendsDF)
tail(friendsDF[order(friendsDF$episode_rating), ])
friendsDF <- merge(friendsDFrating, ratings, by.x = "show_title_id", by.y = "title_id")[ , c("primary_title.x", "primary_title.y", "rating.x", "rating.y", "season_number")]
names(friendsDF) <- c("episode_title", "show_title", "episode_rating", "show_rating", "season_number")
head(friendsDF)
sznFiveGood <- friendsDF[(friendsDF$episode_rating > 9) & (friendsDF$season_number == 5), ]
print(sznFiveGood)
results <- friendsDF
season_number = 6
results[results$episode_rating > 9 & results$season_number == season_number,]
subset(results, episode_rating > 9 & season_number == season_number)
subset(results, episode_rating > 9 & season_number == 6)