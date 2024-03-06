#### Preamble ####
# Purpose: Simulates number deaths by year, gender and age 
# Author: Gavin Crooks, Mohid Sharif and Samarth Rajani
# Date: 6 March 2024
# Contact: gavin.crooks@mail.utoronto.ca, mohid.sharif@mail.utoronto.ca and samarth.rajani@mail.utoronto.ca 
# License: MIT
# Pre-requisites: NA


#### Workspace setup ####
library(tidyverse)

#### Simulate data ####
# Set the seed for reproducibility
set.seed(93)

# Simulate data
years <- rep(seq(2017, 2023, by = 1), each = 5)
age_groups <- sample(c("40-59", "20-39", "60+", "<20"), size = 35, replace = TRUE, prob = c(0.2, 0.2, 0.1, 0.5))
genders <- sample(c("Female", "Male"), size = 35, replace = TRUE, prob = c(0.35, 0.65))
counts <- round(rpois(length(years), 9.5))

# Create the simulated data frame
simulated_data <- data.frame(
  Year_of_death = years,
  Age_group = age_groups,
  Gender = genders,
  Count = counts
)

### Save simulated data ###
write_csv(simulated_data, "data/simulated_data.csv")






