#### Preamble ####
# Purpose: Tests the cleaned data from outputs to make sure everything is correct
# Author: Yi Fei Pang
# Date: 2024-01-23
# Contact: yifei.pang@mail.utoronto.ca
# License: MIT
# Pre-requisites: None



#### Workspace setup ####
library(tidyverse)
library(dplyr)
library(readr)

#### Test data ####
# A few test cases to ensure that the data is correct, all final
# print statements should come out to be true if data is accurate

# First read in the data from the clean data
clean_data <- read_csv("outputs/data/shelter_cleaned.csv")

# Check that the earliest date is not before January 1st
earliest_date_condition <- min(clean_data$OCCUPANCY_DATE) >
  as.Date("2023-12-31")

# Check that the latest date is not after January 21st
latest_date_condition <- max(clean_data$OCCUPANCY_DATE) <
  as.Date("2024-01-22")

# Check that there are 5 categories for each date
date_count <- table(clean_data$OCCUPANCY_DATE)
unique_sectors <- all(date_count == 5)

print(earliest_date_condition)
print(latest_date_condition)
print(unique_sectors)