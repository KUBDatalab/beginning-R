# creating folders
# always in quotation mark - that indicates that it is 
# a text string.
dir.create("data")
dir.create("data_output")
dir.create("figure_output")

# to run a line, press ctrl+enter

# Downloaded file
download.file("https://raw.githubusercontent.com/KUBDatalab/beginning-R/main/data/SAFI_clean.csv",
              "data/SAFI_clean.csv", mode = "wb")

# do not worry about the scary red text

# Creating objects in R

3 +5

12/7

# assignment operater alt+-
area_hectares <- 1.0

# Parentheses shows the result of the calculation on the righthand side
# on the console - the assignment still happens.
(area_hectares <- 1.0)

2.47 * area_hectares

# Changing values of objects
area_hectares <- 2.5

# Functions

sqrt()

# Help tells us that the round() function takes an input x
# and an argument digits that allows us to specify how round the
# rounding should be.
round(3.14159)

# we can see all possible arguments of functions in this way:
args(round)


# rounding to two digits
round(3.14159, digits = 2)

# naming arguments is not necessary (but recommended!)
round(3.14159, 2)

# we can change order of arguments. In that case we have to 
# name them.
round(digits = 2, x = 3.14159)

# Vectors and datatypes

hh_members <- c(3, 7, 10, 6)

# character (or text) vectors:

respondent_wall_type <- c("muddaub", "burntbricks", "sunbricks")

# to see the content of the vector:
respondent_wall_type

# Inspecting vectors

length(hh_members)

length(respondent_wall_type)

class(hh_members)

class(respondent_wall_type)

str(hh_members)

str(respondent_wall_type)

# adding elements to a vector.

possessions <- c("bicycle", "radio", "television")

possessions <- c(possessions, "mobile_phone")

possessions <- c("car", possessions)

# Different kinds of vectors

num_char <- c(1, 2, 3, "a")
num_logical <- c(1, 2, 3, TRUE, FALSE)
char_logical <- c("a", "b", "c", TRUE)
tricky <- c(1, 2, 3, "4")

# installing packages

install.packages("tidyverse")
library(tidyverse)

# reading in a dataframe

read_csv("data/SAFI_clean.csv")

interviews <- read_csv("data/SAFI_clean.csv")

# use this to adress specifict columns instead of attach
interviews$no_meals

# selecting columns and filtering rows

select(interviews, village, no_membrs)

# it is not that bad here - there are only 131 rows. But 
# tibbles are preferred today rather than dataframes - because 
# if there was 1000 rows, we would see them all... Not nice


filter(interviews, village == "Chirodzo")

# We can filter on more than one thing:

filter(interviews,  village == "Chirodzo", 
       no_membrs > 4, no_meals > 2)

# filter by default filters with AND. All comparisons have to
# be true.

filter(interviews,  village == "Chirodzo" & 
       no_membrs > 4 & no_meals > 2)

# The OR operator. Returns rows where village is either Chirodzo or Ruaca

filter(interviews, village == "Chirodzo"| village == "Ruaca")

# Pipes

interviews_ch <- select(filter(interviews, village == "Chirodzo"), 
                        village:respondent_wall_type)

interviews_ch

# shortcut for the pipe
# ctrl+shift+m
# command+shift+m on mac

interviews %>% 
  filter(village == "Chirodzo") %>% 
  select(village:respondent_wall_type)

# Note interviews is not changed. We will need to save the output
# as an object

interviews_ch <- interviews %>% 
  filter(village == "Chirodzo") %>% 
  select(village:respondent_wall_type)

# mutate - creating new columns

interviews %>% 
  mutate(total_meals = no_membrs*no_meals)



# avoid use of attach! 
# Attaching a dataset, containg a column name called "score",
# allows us to work directly with the column just writing "score".
# 
# that feels nice. But is risky. What happens when we have to datasets
# both containing a column called "score" and we attach both?
# 
# Which version of "score" are we then referring to?
#
# Address your data directly, so there is no ambiquity. Using 
# attach() seriously increases the potential for confusion and
# makes debugging and finding errors more difficult.
