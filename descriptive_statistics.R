library(moments)

movies <- read.csv("/home/emu/R Projects/Exploratory Data Analysis with R/Movies.csv",
                   header = TRUE,
                   sep = ",")

genres <- read.csv("/home/emu/R Projects/Exploratory Data Analysis with R/Genres.csv",
                   header = TRUE,
                   sep = ",")

head(movies)
head(genres)

# analyze univariate qualitative variable [Location, Spread, Shape]
table(movies$Rating)
table(genres$Genre)

## Analyze the location of quanlitative variable
mean(movies$Runtime)
median(movies$Runtime)
which.max(table(movies$Runtime))

## Analyze the Spread of quanlitative variable
min(movies$Runtime)
max(movies$Runtime)
range(movies$Runtime)
diff(range(movies$Runtime))
quantile(movies$Runtime)
quantile(movies$Runtime, 0.35)
IQR(movies$Runtime) # Inter Quantile Range
var(movies$Runtime)
sd(movies$Runtime)

## Analyze the Shape of quanlitative variable
skewness(movies$Runtime)
kurtosis(movies$Runtime)
plot(density(movies$Runtime))
summary(movies$Runtime)

# Bivariate statistics for qualitative variable
table(genres$Genre, genres$Rating)

# Bivariate statistics for two qualitative variable
## Covariance
cov(movies$Runtime, movies$Box.Office)
cov(movies$Critic.Score, movies$Box.Office)

## Correlation Coefficients [Runtime much co-related with BoxOffice]
cor(movies$Runtime, movies$Box.Office)
cor(movies$Critic.Score, movies$Box.Office)

# Bivariate statistics for both a qualitative variable and a quantative variable
tapply(movies$Box.Office, movies$Rating, mean)
tapply(genres$Box.Office, genres$Genre, mean)

# WHOLE SUMMARY 
summary(movies)

