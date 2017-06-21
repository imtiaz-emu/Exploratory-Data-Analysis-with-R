library(ggplot2)

# Load data
movies <- read.csv("/home/emu/R Projects/Exploratory Data Analysis with R/Movies.csv",
                   header = TRUE,
                   sep = ",")

genres <- read.csv("/home/emu/R Projects/Exploratory Data Analysis with R/Genres.csv",
                   header = TRUE,
                   sep = ",")

# Peek at the data
head(movies)
head(genres)

# Qualitative Univariate analysis [Number of movies by Rating]
## Bar chart
ggplot(
  data = movies, 
  aes(x = movies$Rating)
) + geom_bar() +
  ggtitle("Number of movies by Rating") +
  xlab("Movie Ratings") +
  ylab("Number of Movies")

## Pie Chart
ggplot(
  data = movies, 
  aes(x = movies$Rating, fill = factor(movies$Rating))
) + geom_bar() + coord_polar("x", start=0)

# Quantative Univariate analysis [Movie Runtime]
## Dot chart
ggplot(movies, aes(x = movies$Runtime)) + 
  geom_dotplot(binwidth = 0.5, stackdir = "center") +
  ggtitle("Dot Plot based on Movie Runtime") +
  xlab("Movie Runtime") +
  ylab("Count")

## Box chart
ggplot(movies, aes(x = movies$Runtime, y = movies$Runtime)) + 
  geom_boxplot() +
  coord_flip() +
  ggtitle("Box Plot based on Movie Runtime") +
  ylab("Movie Runtime") +
  xlab("")

## Histogram of movie Runtime
ggplot(data=movies, aes(movies$Runtime)) + geom_histogram(binwidth = 10)

## Density Plot
ggplot(data=movies, aes(x = movies$Runtime)) + geom_density()

# Qualitative Bivariate analysis [Two Categorical variables]
## Spine Plot
spineplot(x = genres$Genre, y = genres$Rating)

## Mosaic Plot
mosaicplot(x = table(genres$Genre, genres$Rating), las = 3)

# Quantative Bivariate analysis [Two Numerical variables]
## ScatterPlot [with Runtime]
plot(x = movies$Runtime, y = movies$Box.Office)
## ScatterPlot [with Critic Score]
plot(x = movies$Critic.Score, y = movies$Box.Office)

## Plot a line graph Number of movies per year
plot(x = table(movies$Year), type = "l")

# Bivariate analysis between a Numerical and a Categorical Variable
## Barplot of average box office by rating
barplot(tapply(movies$Box.Office, movies$Rating, mean))
## Barplot of average box office by genre
barplot(tapply(genres$Box.Office, genres$Genre, mean), las = 3)

## plot bivariate variables in box plot
plot(
  y = movies$Box.Office,
  x = movies$Rating
)

# Summarizing the whole table
plot(movies)
