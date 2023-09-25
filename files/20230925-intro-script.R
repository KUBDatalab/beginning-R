# Where to find this file:
# https://raw.githubusercontent.com/KUBDatalab/beginning-R/main/files/20230925-intro-script.R


# Make data-directory
# dir.create("data")

# Additional directories/folders
# Not strictly necessary for this project.
# But good practice!
# dir.create("data_output")
# dir.create("fig_output")

# downloading data for later
# download.file("https://raw.githubusercontent.com/KUBDatalab/beginning-R/main/data/SAFI_clean.csv",
#              "data/SAFI_clean.csv", mode = "wb")

# Install packages
# Name of package should be in quotation marks
# install.packages is searching for the name
# install.packages("tidyverse")

# Note that lines 6, 11, 12, 15, 16 and 21 are commented out - we only need to run
# them once, so we make them comments after the first run. But consider 
# keeping them them in your script. That makes it easier for others to 
# figure out what to do.
              
# Simple math in R:
3 + 5
12/7

# Creating objects using the assignment operator
# We store the value 1.0 in the object, sometimes called a variable
# named on the left-hand side.
area_hectares <- 1.0

# We could use the = sign. Please do not, we use that for other stuff as
# well, and keeping the use consistent makes the code easier to read.

# Naming objects? As short as possible, as long as necessary. Make sure 
# the name describes what is stored in the object, but keep it short
# enough that you would like to type it more than once.
# Object names must never begin with a number, contain a white space, or 
# special characters like *, - or + that we use for math.

# we can do math on objects
2.47 * area_hectares

# We can change the value of objects:
area_hectares <- 2.5

# using functions:
b <- sqrt(a) # note that the object a has not been defined. We will get an error!
round(3.14159)

# Getting help:
?round

# we can see that by default rounds to the whole number. We can adjust
# how many digits it rounds to:
round(3.14159, 2)

# it is good practice to name your arguments:
round(3.14159, digits = 2)

# That makes it easier for other people to read and understand, without 
# reading the documentation.

# Vectors!
# A series of values - of the same type! No mix and match.

hh_members <- c(3, 7, 10, 6)

# taking a look:
hh_members

# Vectors can contain text:
respondent_wall_type <- c("muddaub", "burntbricks", "sunbricks")

# Bonus info - muddaubed walls are an very sustainable building technique:
# https://en.wikipedia.org/wiki/Wattle_and_daub

# Getting information about objects.
# in this case the number of elements in the vectors:
length(hh_members)

length(respondent_wall_type)

# And we can get the type of data in a vector

class(hh_members)
class(respondent_wall_type)

# and even more information using the str() function
str(hh_members)
str(respondent_wall_type)

# adding content to a vector:
possesions <- c("bicycle", "radio", "television")

possesions <- c(possesions, "mobile phone")

# Looking at data/objects

View(possesions)

# note the uppercase V!

# adding content to the beginning of a vector:
possesions <- c("car", possesions)

# another way of checking datatype:
typeof(possesions)

# Trying to make a vector with mixed datatypes:

num_chars <- c(1, 2, 3, "a")

# Looking at the result:
num_chars

# what type is this data:
typeof(num_chars)

# we can understand 1 as a character. But not a as a number - R will
# store the 1 as a character. That means we will not be able to do math
# on the vector!

# Subsetting vectors:
respondent_wall_type[2]

respondent_wall_type[c(3, 2)]

more_respondent_wall_type <- respondent_wall_type[c(1, 2, 3, 2, 1, 3)]

more_respondent_wall_type

# conditional subsetting

hh_members <- c(3, 7, 10, 6)
# Using a boolean, logical, vector to subset at a vector
hh_members <- hh_members[c(TRUE, FALSE, TRUE, TRUE)]

# the elements returned, are the ones matching a "TRUE" value

# a logical comparison will return a logical vector that can be used to subset
# a vector
hh_members > 5

# That can be used for subsetting:
hh_members[hh_members <4 | hh_members > 7]

hh_members[hh_members >= 4 & hh_members <= 7]

# We can do the same on character vectors:

possesions <- c("car", "bicycle", "radio", "television", "mobile phone")
possesions[possessions == "car" | possesions == "bicycle"]

possesions %in% c("car", "bicycle")

possesions %in% c("car", "bicycle", "motorcycle", "truck", "boat", "bus")

# Missing data

rooms <- c(2, 1, 1, NA, 7)

mean(rooms)

max(rooms)

# Using the argument na.rm allows us to calculate the results anyway:

mean(rooms, na.rm = TRUE)
max(rooms, na.rm = T) # Note that instead of typing TRUE, we can just type T

rooms[!is.na(rooms)]
sum(is.na(rooms))

# Load packages
# Now we do not need the quotation marks
# After install the library exists as an object in a package database
# And can be loaded without quotation marks.
library(tidyverse)

# Read in the data to an object.
# Note the difference between csv and csv2
safi <- read_csv("data/SAFI_clean.csv")

# view the dataframe or tibble. 
view(safi)

# manipulating data
safi %>% select(village, no_membrs, no_meals)


safi %>% 
  select(-interview_date) %>%
  mutate(tot_meals = no_membrs * no_meals) %>% 
  filter(village == "Chirodzo") %>% 
  summarise(average_tot_meals = mean(tot_meals),
            std_dev_tot_meals = sd(tot_meals))

# group_by groups the data frame!
safi %>% 
  select(-interview_date) %>%
  mutate(tot_meals = no_membrs * no_meals) %>% 
  group_by(village) %>% 
  summarise(average_tot_meals = mean(tot_meals),
            std_dev_tot_meals = sd(tot_meals))


# can we do it separately?
safi2 <- select(safi, -interview_date)
safi3 <- mutate(safi2, tot_meals = no_membrs * no_meals)
safi4 <- group_by(safi3, village)
summarise(safi4, average_tot_meals = mean(tot_meals))
