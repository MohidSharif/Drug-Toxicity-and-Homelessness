#### Preamble ####
# Purpose: Models the relationship between the number of deaths, age group and gender 
# Author 1: Mohid Sharif
# Author 2: Gavin Crooks
# Author 3: Samarth
# Date: 12 Marth 2024
# Contact: mohid.sharif@mail.utoronto.ca
# License: MIT
# Pre-requisites: 00-simulate_data.R or 01-download_data.R and 02-data_cleaning.R



#### Workspace setup ####
library(tidyverse)
library(rstanarm)


#### Read data ####
analysis_data <- read_csv("data/analysis_data/cleaned_data.csv")

### Model data ####
# Poisson Model just age 
first_model <-
  stan_glm(
    formula = Count ~ Age_group,
    data = analysis_data,
    family = poisson (link = "log"),
    prior = normal(location = 0, scale = 23, autoscale = TRUE),
    prior_intercept = normal(location = 0, scale = 1, autoscale = TRUE),
    prior_aux = exponential(rate = 0.33, autoscale = TRUE),
    seed = 93
  )

prior_summary(first_model)

# Poisson Model just Gender
second_model <- 
  stan_glm(
  formula = Count ~ Gender,
  data = analysis_data,
  family = poisson(link = "log"),
  prior = normal(location = 0, scale = 2.5, autoscale = TRUE),
  prior_intercept = normal(location = 0, scale = 2.5, autoscale = TRUE),
  prior_aux = exponential(rate = 1, autoscale = TRUE),
  seed = 93
)

prior_summary(second_model)
# Poisson Model Gender and age
third_model <-
  stan_glm(
    formula = Count ~ Gender + Age_group,
    data = analysis_data,
    family = poisson (link = "log"),
    prior = normal(location = 0, scale = 23, autoscale = TRUE),
    prior_intercept = normal(location = 0, scale = 1, autoscale = TRUE),
    prior_aux = exponential(rate = 0.33, autoscale = TRUE),
    seed = 93
  )
prior_summary(third_model)

# Negative Binomial Model just age
fourth_model <-
  stan_glm(
    formula = Count ~ Age_group,
    data = analysis_data,
    family = neg_binomial_2(link = "log"),
    prior = normal(location = 0, scale = 23, autoscale = TRUE),
    prior_intercept = normal(location = 0, scale = 1, autoscale = TRUE),
    prior_aux = exponential(rate = 0.33, autoscale = TRUE),
    seed = 93
  )


# Negative Binomial Model just Gender
fifth_model <- 
  stan_glm(
    formula = Count ~ Gender,
    data = analysis_data,
    family = neg_binomial_2(link = "log"),
    prior = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_intercept = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_aux = exponential(rate = 1, autoscale = TRUE),
    seed = 93
  )

# Negative Binomial Model Gender and age
sixth_model <-
  stan_glm(
    formula = Count ~ Gender + Age_group,
    data = analysis_data,
    family = neg_binomial_2(link = "log"),
    prior = normal(location = 0, scale = 23, autoscale = TRUE),
    prior_intercept = normal(location = 0, scale = 1, autoscale = TRUE),
    prior_aux = exponential(rate = 0.33, autoscale = TRUE),
    seed = 93
  )

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

saveRDS(
  fifth_model,
  file = "models/fifth_model.rds"
)

saveRDS(
  sixth_model,
  file = "models/sixth_model.rds"
)

