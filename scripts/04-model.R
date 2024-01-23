#### Preamble ####
# Purpose: Model the data from cleaned_shelter
# Author: Yi Fei Pang
# Date: 2024-01-23
# Contact: yifei.pang@mail.utoronto.ca
# License: MIT
# Pre-requisites: None

#### Workspace setup ####
library(tidyverse)
library(ggplot2)

#### Read data ####
cleaned_shelter <- read_csv("outputs/data/shelter_cleaned.csv")

### Model data ####
model <- ggplot(cleaned_shelter, aes(x = as.Date(OCCUPANCY_DATE), 
                                     y = Sector_Sum, fill = SECTOR)) +
  geom_bar(stat = "identity", position = "dodge") +
  # label title and axis of bar graph accordingly
  labs(title = "Shelter Users by Demographics",
       x = "Date and Sector",
       y = "People Count",
       fill = "Sector") +
  theme_minimal() +
  # add slight tilt to the labels for legibility
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
# citation: https://tellingstorieswithdata.com/02-drinking_from_a_fire_hose.html
## https://r-graph-gallery.com/218-basic-barplots-with-ggplot2.html 


#### Save model ####
ggsave("model.png", plot = model)

