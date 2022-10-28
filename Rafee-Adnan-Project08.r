options(repr.matrix.max.cols=25, repr.matrix.max.rows=200)
options(jupyter.rich_display = F)
library(data.table)
titles <- data.frame(fread("/anvil/projects/tdm/data/movies_and_tv/titles.csv"))
episodes <- data.frame(fread("/anvil/projects/tdm/data/movies_and_tv/episodes.csv"))
people <- data.frame(fread("/anvil/projects/tdm/data/movies_and_tv/people.csv"))
ratings <- data.frame(fread("/anvil/projects/tdm/data/movies_and_tv/ratings.csv"))
counts <- table(mtcars$vs, mtcars$gear)
barplot(counts, main="Car Distribution by Gears and VS",
  xlab="Number of Gears", col=c("darkblue","red"),
  legend = rownames(counts), beside=TRUE)
str(titles)
counts <- table(titles$runtime_minutes, titles$premiered)
barplot(counts, main="Titles Distribution by Year Premiered and Runtime Minutes",
  xlab="Year Premiered", col=c("darkblue","red"),
  legend = rownames(counts), beside=TRUE)
str(people)
plot(people$born, (people$died), type = "b", pch = 19, 
     col = "red", xlab = "x", ylab = "y")
find_movie_with_at_least_rating <- function(titles_df, ratings_df, ratings_of_at_least) {
    results <- merge(ratings_df, titles_df, by.x = "title_id", by.y = "title_id")
    popular_movie_results <- results[results$type == "movie" & results$rating >= ratings_of_at_least, ]
    return(popular_movie_results)
    }
myDF <- find_movie_with_at_least_rating(titles, ratings, 9.5)
head(myDF)
dim(myDF)
my_selection <- find_movie_with_at_least_rating(titles, ratings, 7.6)
str(my_selection)
dim(my_selection)
find_movie_with_lower_than_rating <- function(titles_df, ratings_df, ratings_of_at_least) {
    results <- merge(ratings_df, titles_df, by.x = "title_id", by.y = "title_id")
    popular_movie_results <- results[results$type == "movie" & results$rating < ratings_of_at_least, ]
    return(popular_movie_results)
    }
dim(find_movie_with_lower_than_rating(titles, ratings, 5.0))
most_popular_movie_in_genre <- function(titles_df, ratings_df, genre) {
    results <- merge(ratings_df, titles_df, by.x = "title_id", by.y = "title_id")
    genre_results <- results[results$type == "movie" & results$genres == genre, ]
    popular_df <- genre_results[genre_results$rating == max(genre_results$rating), ]
    return(popular_df)
}
most_popular_movie_in_genre(titles, ratings, "War")