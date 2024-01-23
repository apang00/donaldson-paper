#### Preamble ####
# Purpose: Clean data from raw dataset of shelters
# Author: Yi Fei Pang
# Date: 2024-01-23
# Contact: yifei.pang@mail.utoronto.ca
# License: MIT
# Pre-requisites: None


#### Workspace setup ####
library(tidyverse)
library(janitor)
library(dplyr)
library(readr)

#### Clean data ####
# First read in the raw data
shelter_raw <- read_csv("inputs/data/shelter_raw.csv")

# From the raw data, I want to remove the columns that are not needed
columns_req <- 
  shelter_raw[, c("OCCUPANCY_DATE", "SECTOR", "SERVICE_USER_COUNT")]

# From the column requirements, I sum the column which has the count of all
# the total people per sector, then I combine the sectors based on dates
cleaned_shelter <- columns_req %>%
  select(
    OCCUPANCY_DATE,
    SECTOR,
    SERVICE_USER_COUNT
  ) %>% 
  group_by(OCCUPANCY_DATE, SECTOR) %>%
  summarise(Sector_Sum = sum(SERVICE_USER_COUNT))
cleaned_shelter

#Citation: https://tellingstorieswithdata.com/errata.html#errors

#### Save data ####
write_csv(shelter_cleaned, "outputs/data/shelter_cleaned.csv")
