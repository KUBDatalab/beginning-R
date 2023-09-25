# Install packages
install.packages("tidyverse")

# Load packages
library(tidyverse)

# Make data-directory
dir.create("data")

# downloading data for later
download.file("https://raw.githubusercontent.com/KUBDatalab/beginning-R/main/data/SAFI_clean.csv",
              "data/SAFI_clean.csv", mode = "wb")

