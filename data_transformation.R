# Import the movies Data
movies <- read.table(
  file = "/home/emu/R Projects/Exploratory Data Analysis with R/Movies.txt",
  sep = "\t",
  header = TRUE)

# See first 6 rows of the data
head(movies)

# How many rows with empty or faulty data
sum(is.na(movies))

# get the name of the columns of the imported data
names(movies)

# Problem #1: renaming column
names(movies)[5] <- "Critic.Score"
names(movies)

# Problem #2: remove the faulty rows
tail(movies)
movies <- na.omit(movies)

# Problem #3: Convert column from factor to integer
class(movies$Runtime)
head(movies$Runtime)
runtimes <- as.character(movies$Runtime) # factor to character 
runtimes <- sub(" min", "", runtimes) # remove the min portion
movies$Runtime <- as.integer(runtimes) # runtimes converted to integer
head(movies$Runtime) 
mean(movies$Runtime) # mean operation run on newly converted data

# Problem #4: Box Office 3 type unit must be changed to one universal unit
head(movies$Box.Office)
class(movies$Box.Office)
box_office <- as.character(movies$Box.Office) # factor to character 

## create a function to convert the box office revenue
convertBoxOffice <- function(boxOffice){
  box_office <- gsub("[$|M|k]", "", boxOffice)  
  box_office <- as.numeric(box_office)
  
  if(grepl("M", boxOffice)){
    box_office
  }else if(grepl("k", boxOffice)){
    box_office * 0.001
  }else{
    box_office * 0.000001
  }
  
  return(box_office)
  
}

movies$Box.Office <- sapply(box_office, convertBoxOffice)
tail(movies$Box.Office)

# Export data to CSV
write.csv(movies, "/home/emu/R Projects/Exploratory Data Analysis with R/Movies.csv")

tail(movies)
