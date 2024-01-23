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

#### Download Data ####

# Daily shelter visitor count
package <- show_package("21c83b32-d5a8-4106-a54f-010dbe49f6f2")

# get all resources for this package
resources <- list_package_resources("21c83b32-d5a8-4106-a54f-010dbe49f6f2")

# identify datastore resources; by default, Toronto Open Data sets datastore 
# resource format to CSV for non-geospatial and GeoJSON for geospatial resources

# load the first datastore resource as a sample
shelter_count <- filter(datastore_resources, row_number()==1) %>% get_resource()

#Citation: https://open.toronto.ca/dataset/daily-shelter-overnight-service-occupancy-capacity/

#### Save data ####
write_csv(shelter_count, "outputs/data/shelter_raw.csv")


         
