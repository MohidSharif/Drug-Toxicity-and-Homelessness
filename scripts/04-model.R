#### Preamble ####
# Purpose: Models... [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 11 February 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]


#### Workspace setup ####
library(tidyverse)
library(rstanarm)


#### Read data ####
analysis_data <- read_csv("data/analysis_data/cleaned_data.csv")

### Model data ####
first_model <-
  stan_glm(
    formula = counts ~ age_groups,
    data = analysis_data,
    family = gaussian(),
    prior = normal(location = 0, scale = 23, autoscale = TRUE),
    prior_intercept = normal(location = 0, scale = 1, autoscale = TRUE),
    prior_aux = exponential(rate = 0.33, autoscale = TRUE),
    seed = 93
  )
prior_summary(first_model)

second_model <- 
  stan_glm(
  formula = counts ~ genders,
  data = analysis_data,
  family = gaussian(),
  prior = normal(location = 0, scale = 2.5, autoscale = TRUE),
  prior_intercept = normal(location = 0, scale = 2.5, autoscale = TRUE),
  prior_aux = exponential(rate = 1, autoscale = TRUE),
  seed = 93
)

prior_summary(second_model)

third_model <-
  stan_glm(
    formula = counts ~ genders + age_groups,
    data = analysis_data,
    family = gaussian(),
    prior = normal(location = 0, scale = 23, autoscale = TRUE),
    prior_intercept = normal(location = 0, scale = 1, autoscale = TRUE),
    prior_aux = exponential(rate = 0.33, autoscale = TRUE),
    seed = 93
  )
prior_summary(third_model)

fourth_model <-
  stan_glm(
    formula = counts ~ years,
    data = analysis_data,
    family = gaussian(),
    prior = normal(location = 0, scale = 25, autoscale = TRUE),
    prior_intercept = normal(location = 0, scale = 3, autoscale = TRUE),
    prior_aux = exponential(rate = 1, autoscale = TRUE),
    seed = 93
  )
prior_summary(fourth_model)

#### Save model ####
saveRDS(
  first_model,
  file = "models/first_model.rds"
)

saveRDS(
  second_model,
  file = "models/second_model.rds"
)

saveRDS(
  third_model,
  file = "models/third_model.rds"
)

saveRDS(
  fourth_model,
  file = "models/fourth_model.rds"
)
