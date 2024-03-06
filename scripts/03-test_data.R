#### Preamble ####
# Purpose: Tests... [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 11 February 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]


#### Workspace setup ####
library(tidyverse)
cleaned_data <- read_csv("data/cleaned_data.csv")
gender_deaths_data <- read_csv("data/gender_deaths_data.csv")
age_group_deaths_data <- read_csv("data/age_group_deaths_data.csv")

#### Test data ####
# Test 4 variables
cleaned_data %>% 
  unique() %>% 
  length() == 4

# Test Class of variables 
is.numeric(cleaned_data$Year_of_death)
is.character(cleaned_data$Age_group)
is.character(cleaned_data$Gender)
is.numeric(cleaned_data$Count)

# Testing the maximum number of deaths for a given year and gender is reasonable 
cleaned_data$Count |> max() <= 75

# Testing the minimum number of deaths for a given year and gender is greater or equal to 0 
cleaned_data$Count |> min() >= 0 

# Testing if the correct number of age ranges 
cleaned_data$Age_group|>
  unique() == c("40-59","20-39", "60+", "<20" )

# Test correct range of years 
cleaned_data$Year_of_death|>
  unique() == c('2017', '2018', '2019', '2020', '2021', '2022', '2023')

# Test correct values in gender  
cleaned_data$Gender|>
  unique() == c('Female', 'Male')

# Test consistency by age group 

# Specify the year to check
target_year <- 2021

# Calculate the total count for all Age_groups for the specified year
total_count_all_age_groups <- sum(cleaned_data$Count[cleaned_data$Year_of_death == target_year])

# Calculate the total count for each Age_group for the specified year
total_count_by_age_group <- cleaned_data %>%
  filter(Year_of_death == target_year) %>%
  group_by(Age_group) %>%
  summarise(total_count = sum(Count))

# Check if the totals are equal
if (total_count_all_age_groups == sum(total_count_by_age_group$total_count)) {
  print(paste("For the year", target_year, "the total count by Age_group is consistent."))
} else {
  print(paste("For the year", target_year, "the total count by Age_group is inconsistent."))
}

# Test consistency by age gender 

# Specify the year to check
target_year <- 2017

# Calculate the total count for all Genders for the specified year
total_count_all_genders <- sum(cleaned_data$Count[cleaned_data$Year_of_death == target_year])

# Calculate the total count for each Gender for the specified year
total_count_by_gender <- cleaned_data %>%
  filter(Year_of_death == target_year) %>%
  group_by(Gender) %>%
  summarise(total_count = sum(Count))

# Check if the totals are equal
if (total_count_all_genders == sum(total_count_by_gender$total_count)) {
  print(paste("For the year", target_year, "the total count by Gender is consistent."))
} else {
  print(paste("For the year", target_year, "the total count by Gender is inconsistent."))
}


# Test for missing values
is.na(cleaned_data)

