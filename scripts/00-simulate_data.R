#### Preamble ####
# Purpose: Simulates shelter data collected form OpenTorontoData in 2024
# Author: Yi Fei Pang
# Date: 2024-01-23
# Contact: yifei.pang@mail.utoronto.ca
# License: MIT
# Pre-requisites: None


#### Workspace setup ####
library(tidyverse)
library(janitor)
library(tibble)
library(ggplot2)


#### Data Format Info ####
# The format of the data will have the date of the recording, it will have
# the demographic of the people coming to the shelter, and it should have
# the total count of the number of people


#### Simulate Data ####
# dates will range from January 1st until January 20th
dates <- seq(as.Date("2024-01-01"), as.Date("2024-01-20"), by = "1 day")

# say there are 4 different demographics youth, refugees, families, and homeless
demographics <- sample(c("Youth", "Refugees", "Families", "Homeless"),
                       20, replace = TRUE)

# let's say there are anywhere between 50-200 individual per shelter
people <- sample(50:200, 20, replace = TRUE)

simulated_data <- 
  tibble(
    dates,
    demographics,
    people
  )

simulated_data

#Citation: https://tellingstorieswithdata.com/02-drinking_from_a_fire_hose.html
## https://r-graph-gallery.com/218-basic-barplots-with-ggplot2.html 

# Note: For simplicity, the simulated data only had a single demographic per
# date. However, in the real data, there could be potentially many tens or
# potentially hundreds of demographics per day and probably a much wider
# range of people


#### Graphing Data ####
ggplot(simulated_data, aes(x = as.Date(dates), y = people, fill = demographics)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Demographic of People in The GTA Using Shelters",
       x = "Date",
       y = "Count",
       fill = "Demographic") +
  theme_minimal() +
  scale_x_date(date_labels = "%Y-%m-%d", date_breaks = "1 day") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))


#### Testing Simulation ####
# Test to see if the earliest and latest dates are in order
# The earliest date should be later than December 31, 2023
earliest_date<- min(simulated_data$date) > as.Date("2023-12-31")

# The latest date should be earlier than January 21, 2024
latest_date<- max(simulated_data$date) < as.Date("2024-01-22")

# Test that the count for people is greater than or equal to 0
count_condition <- all(simulated_data$people >= 0)

# Show the results of test, all results should come out to be true otherwise,
# there is an error in the dataset
print(earliest_date)
print(latest_date)
print(count_condition)





