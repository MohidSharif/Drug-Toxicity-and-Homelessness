#### Preamble ####
# Purpose: Cleans the raw plane data recorded by two observers..... [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 6 April 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]

#### Workspace setup ####
library(tidyverse)

#### Clean data ####
raw_data <- read_csv("~/Drug-Toxicity-and-Homelessness/data/raw_data/raw_data.csv")


# Rename year of death column
names(raw_data)[names(raw_data) == 'Year of death'] <- 'Year_of_death'

# Clean data to remove unkown values and isolate causes of deaths relating to drug toxicity
cleaned_data <-
  raw_data |>
  filter(Cause_of_death == "Drug Toxicity", Age_group != "Unknown", Gender != "Unknown") |>
  # Pipe this to include only year of death, age group, gender, and count.
  select(Year_of_death, Age_group, Gender, Count)


head(cleaned_data, n=10)


#### Gender data ####

### Obtain Male deaths for each year ###

new_data <-
  cleaned_data |>
  filter(Year_of_death == 2017, Gender == 'Male') |>
  select(Year_of_death, Gender, Count)
head(new_data, n=10)

male_2017_deaths <- sum(new_data$Count)

new_data <-
  cleaned_data |>
  filter(Year_of_death == 2018, Gender == 'Male') |>
  select(Year_of_death, Gender, Count)
head(new_data, n=10)

male_2018_deaths <- sum(new_data$Count)
  
new_data <-
  cleaned_data |>
  filter(Year_of_death == 2019, Gender == 'Male') |>
  select(Year_of_death, Gender, Count)
head(new_data, n=10)

male_2019_deaths <- sum(new_data$Count)

new_data <-
  cleaned_data |>
  filter(Year_of_death == 2020, Gender == 'Male') |>
  select(Year_of_death, Gender, Count)
head(new_data, n=10)

male_2020_deaths <- sum(new_data$Count)

new_data <-
  cleaned_data |>
  filter(Year_of_death == 2021, Gender == 'Male') |>
  select(Year_of_death, Gender, Count)
head(new_data, n=10)

male_2021_deaths <- sum(new_data$Count)

new_data <-
  cleaned_data |>
  filter(Year_of_death == 2022, Gender == 'Male') |>
  select(Year_of_death, Gender, Count)
head(new_data, n=10)

male_2022_deaths <- sum(new_data$Count)

new_data <-
  cleaned_data |>
  filter(Year_of_death == 2023, Gender == 'Male') |>
  select(Year_of_death, Gender, Count)
head(new_data, n=10)

male_2023_deaths <- sum(new_data$Count)

### Obtain Female deaths for each year ###

new_data <-
  cleaned_data |>
  filter(Year_of_death == 2017, Gender == 'Female') |>
  select(Year_of_death, Gender, Count)
head(new_data, n=10)

female_2017_deaths <- sum(new_data$Count)

new_data <-
  cleaned_data |>
  filter(Year_of_death == 2018, Gender == 'Female') |>
  select(Year_of_death, Gender, Count)
head(new_data, n=10)

female_2018_deaths <- sum(new_data$Count)

new_data <-
  cleaned_data |>
  filter(Year_of_death == 2019, Gender == 'Female') |>
  select(Year_of_death, Gender, Count)
head(new_data, n=10)

female_2019_deaths <- sum(new_data$Count)

new_data <-
  cleaned_data |>
  filter(Year_of_death == 2020, Gender == 'Female') |>
  select(Year_of_death, Gender, Count)
head(new_data, n=10)

female_2020_deaths <- sum(new_data$Count)

new_data <-
  cleaned_data |>
  filter(Year_of_death == 2021, Gender == 'Female') |>
  select(Year_of_death, Gender, Count)
head(new_data, n=10)

female_2021_deaths <- sum(new_data$Count)

new_data <-
  cleaned_data |>
  filter(Year_of_death == 2022, Gender == 'Female') |>
  select(Year_of_death, Gender, Count)
head(new_data, n=10)

female_2022_deaths <- sum(new_data$Count)

new_data <-
  cleaned_data |>
  filter(Year_of_death == 2023, Gender == 'Female') |>
  select(Year_of_death, Gender, Count)
head(new_data, n=10)

female_2023_deaths <- sum(new_data$Count)

### Create the data ###

gender_deaths_data <-
  tibble(
    Year = c('2017', '2017', '2018', '2018', '2019', '2019', '2020', '2020', '2021', '2021', '2022', '2022', '2023', '2023'),
    Gender = c('Male', 'Female', 'Male', 'Female','Male', 'Female','Male', 'Female','Male', 'Female','Male', 'Female','Male', 'Female'),
    Deaths = c(male_2017_deaths, female_2017_deaths, male_2018_deaths, female_2018_deaths, male_2019_deaths, female_2019_deaths, male_2020_deaths, female_2020_deaths, male_2021_deaths, female_2021_deaths, male_2022_deaths, female_2022_deaths, male_2023_deaths, female_2023_deaths)
  )

#### Age Group Data ####

### Obtain all age group data for 2017 ###

new_data <-
  cleaned_data |>
  filter(Year_of_death == 2017, Age_group == '<20') |>
  select(Year_of_death, Gender, Count)
head(new_data, n=10)

youth_2017_deaths <- sum(new_data$Count)


new_data <-
  cleaned_data |>
  filter(Year_of_death == 2017, Age_group == '20-39') |>
  select(Year_of_death, Gender, Count)
head(new_data, n=10)

adults_2017_deaths <- sum(new_data$Count)


new_data <-
  cleaned_data |>
  filter(Year_of_death == 2017, Age_group == '40-59') |>
  select(Year_of_death, Gender, Count)
head(new_data, n=10)

adults2_2017_deaths <- sum(new_data$Count)


new_data <-
  cleaned_data |>
  filter(Year_of_death == 2017, Age_group == '60+') |>
  select(Year_of_death, Gender, Count)
head(new_data, n=10)

elderly_2017_deaths <- sum(new_data$Count)



### Obtain all age group data for 2018 ###

new_data <-
  cleaned_data |>
  filter(Year_of_death == 2018, Age_group == '<20') |>
  select(Year_of_death, Gender, Count)
head(new_data, n=10)

youth_2018_deaths <- sum(new_data$Count)


new_data <-
  cleaned_data |>
  filter(Year_of_death == 2018, Age_group == '20-39') |>
  select(Year_of_death, Gender, Count)
head(new_data, n=10)

adults_2018_deaths <- sum(new_data$Count)


new_data <-
  cleaned_data |>
  filter(Year_of_death == 2018, Age_group == '40-59') |>
  select(Year_of_death, Gender, Count)
head(new_data, n=10)

adults2_2018_deaths <- sum(new_data$Count)


new_data <-
  cleaned_data |>
  filter(Year_of_death == 2018, Age_group == '60+') |>
  select(Year_of_death, Gender, Count)
head(new_data, n=10)

elderly_2018_deaths <- sum(new_data$Count)


### Obtain all age group data for 2019 ###

new_data <-
  cleaned_data |>
  filter(Year_of_death == 2019, Age_group == '<20') |>
  select(Year_of_death, Gender, Count)
head(new_data, n=10)

youth_2019_deaths <- sum(new_data$Count)


new_data <-
  cleaned_data |>
  filter(Year_of_death == 2019, Age_group == '20-39') |>
  select(Year_of_death, Gender, Count)
head(new_data, n=10)

adults_2019_deaths <- sum(new_data$Count)


new_data <-
  cleaned_data |>
  filter(Year_of_death == 2019, Age_group == '40-59') |>
  select(Year_of_death, Gender, Count)
head(new_data, n=10)

adults2_2019_deaths <- sum(new_data$Count)


new_data <-
  cleaned_data |>
  filter(Year_of_death == 2019, Age_group == '60+') |>
  select(Year_of_death, Gender, Count)
head(new_data, n=10)

elderly_2019_deaths <- sum(new_data$Count)


### Obtain all age group data for 2020 ###

new_data <-
  cleaned_data |>
  filter(Year_of_death == 2020, Age_group == '<20') |>
  select(Year_of_death, Gender, Count)
head(new_data, n=10)

youth_2020_deaths <- sum(new_data$Count)


new_data <-
  cleaned_data |>
  filter(Year_of_death == 2020, Age_group == '20-39') |>
  select(Year_of_death, Gender, Count)
head(new_data, n=10)

adults_2020_deaths <- sum(new_data$Count)


new_data <-
  cleaned_data |>
  filter(Year_of_death == 2020, Age_group == '40-59') |>
  select(Year_of_death, Gender, Count)
head(new_data, n=10)

adults2_2020_deaths <- sum(new_data$Count)


new_data <-
  cleaned_data |>
  filter(Year_of_death == 2020, Age_group == '60+') |>
  select(Year_of_death, Gender, Count)
head(new_data, n=10)

elderly_2020_deaths <- sum(new_data$Count)


### Obtain all age group data for 2021 ###

new_data <-
  cleaned_data |>
  filter(Year_of_death == 2021, Age_group == '<20') |>
  select(Year_of_death, Gender, Count)
head(new_data, n=10)

youth_2021_deaths <- sum(new_data$Count)


new_data <-
  cleaned_data |>
  filter(Year_of_death == 2021, Age_group == '20-39') |>
  select(Year_of_death, Gender, Count)
head(new_data, n=10)

adults_2021_deaths <- sum(new_data$Count)


new_data <-
  cleaned_data |>
  filter(Year_of_death == 2021, Age_group == '40-59') |>
  select(Year_of_death, Gender, Count)
head(new_data, n=10)

adults2_2021_deaths <- sum(new_data$Count)


new_data <-
  cleaned_data |>
  filter(Year_of_death == 2021, Age_group == '60+') |>
  select(Year_of_death, Gender, Count)
head(new_data, n=10)

elderly_2021_deaths <- sum(new_data$Count)


### Obtain all age group data for 2022 ###

new_data <-
  cleaned_data |>
  filter(Year_of_death == 2022, Age_group == '<20') |>
  select(Year_of_death, Gender, Count)
head(new_data, n=10)

youth_2022_deaths <- sum(new_data$Count)


new_data <-
  cleaned_data |>
  filter(Year_of_death == 2022, Age_group == '20-39') |>
  select(Year_of_death, Gender, Count)
head(new_data, n=10)

adults_2022_deaths <- sum(new_data$Count)


new_data <-
  cleaned_data |>
  filter(Year_of_death == 2022, Age_group == '40-59') |>
  select(Year_of_death, Gender, Count)
head(new_data, n=10)

adults2_2022_deaths <- sum(new_data$Count)


new_data <-
  cleaned_data |>
  filter(Year_of_death == 2022, Age_group == '60+') |>
  select(Year_of_death, Gender, Count)
head(new_data, n=10)

elderly_2022_deaths <- sum(new_data$Count)


### Obtain all age group data for 2023 ###

new_data <-
  cleaned_data |>
  filter(Year_of_death == 2023, Age_group == '<20') |>
  select(Year_of_death, Gender, Count)
head(new_data, n=10)

youth_2023_deaths <- sum(new_data$Count)


new_data <-
  cleaned_data |>
  filter(Year_of_death == 2023, Age_group == '20-39') |>
  select(Year_of_death, Gender, Count)
head(new_data, n=10)

adults_2023_deaths <- sum(new_data$Count)


new_data <-
  cleaned_data |>
  filter(Year_of_death == 2023, Age_group == '40-59') |>
  select(Year_of_death, Gender, Count)
head(new_data, n=10)

adults2_2023_deaths <- sum(new_data$Count)


new_data <-
  cleaned_data |>
  filter(Year_of_death == 2023, Age_group == '60+') |>
  select(Year_of_death, Gender, Count)
head(new_data, n=10)

elderly_2023_deaths <- sum(new_data$Count)


#### Create the data ###

age_group_deaths_data <-
  tibble(
    Year = c('2017', '2017', '2017', '2017', '2018', '2018', '2018', '2018', '2019', '2019', '2019', '2019', '2020', '2020', '2020', '2020', '2021', '2021', '2021', '2021', '2022', '2022', '2022', '2022', '2023', '2023', '2023', '2023'),
    Age_group = c('<20', '20-39', '40-59', '60+', '<20', '20-39', '40-59', '60+', '<20', '20-39', '40-59', '60+', '<20', '20-39', '40-59', '60+', '<20', '20-39', '40-59', '60+', '<20', '20-39', '40-59', '60+', '<20', '20-39', '40-59', '60+'),
    Deaths = c(youth_2017_deaths, adults_2017_deaths, adults2_2017_deaths, elderly_2017_deaths, youth_2018_deaths, adults_2018_deaths, adults2_2018_deaths, elderly_2018_deaths, youth_2019_deaths, adults_2019_deaths, adults2_2019_deaths, elderly_2019_deaths, youth_2020_deaths, adults_2020_deaths, adults2_2020_deaths, elderly_2020_deaths, youth_2021_deaths, adults_2021_deaths, adults2_2021_deaths, elderly_2021_deaths, youth_2022_deaths, adults_2022_deaths, adults2_2022_deaths, elderly_2022_deaths, youth_2023_deaths, adults_2023_deaths, adults2_2023_deaths, elderly_2023_deaths)
  )

#### Save data ####
write_csv(cleaned_data, "data/cleaned_data.csv")
write_csv(gender_deaths_data, "data/gender_deaths_data.csv")
write_csv(age_group_deaths_data, "data/age_group_deaths_data.csv")
