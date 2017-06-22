# Load iris data from R Library
data("iris")

# Peek into the data
head(iris)

# Create a scatterplot on iris data for 4 columns
plot(
  x = iris[1:4],
  col = as.integer(iris$Species)
)

# view a scatterplot on Petal Length and Width
plot(
  x = iris$Petal.Length,
  y = iris$Petal.Width,
  col = as.integer(iris$Species)
)

# create a k-means cluster analysis
clusters <- kmeans(
  x = iris[1:4],
  centers = 3,
  nstart = 10
)

# Make Shapes from the cluster
plot(
  x = iris$Petal.Length,
  y = iris$Petal.Width,
  col = as.integer(iris$Species),
  pch = clusters$cluster
)

# Plot centroids of each cluster
points(
  x = clusters$centers[, "Petal.Length"],
  y = clusters$centers[, "Petal.Width"],
  pch = 4,
  lwd = 4,
  col = "blue"
)

# Create a table from the clusters
table(
  x = clusters$cluster,
  y = iris$Species
)
