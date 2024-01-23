#### Preamble ####
# Purpose: Downloads and saves the data from OpenDataToronto
# Author: Yi Fei Pang
# Date: 2024-01-23
# Contact: yifei.pang@mail.utoronto.ca
# License: MIT
# Pre-requisites: None


#### Workplace Setup ####
library(opendatatoronto)
library(tidyverse)
library(dplyr)
library(readr)

#### Donload Data ####

# Daily shelter visitor count
package <- show_package("21c83b32-d5a8-4106-a54f-010dbe49f6f2")

# get all resources for this package
resources <- list_package_resources("21c83b32-d5a8-4106-a54f-010dbe49f6f2")

# identify datastore resources; by default, Toronto Open Data sets datastore 
# resource format to CSV for non-geospatial and GeoJSON for geospatial resources

# load the first datastore resource as a sample
shelter_count <- filter(datastore_resources, row_number()==1) %>% get_resource()


#### Save data ####
write_csv(x = shelter_count, file = "shelter_count.csv")

#### Read Data ####
readr::read_csv("inputs/data/shelter_count_raw.csv")

         
