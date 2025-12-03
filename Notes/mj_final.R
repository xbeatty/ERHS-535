library(tidyverse)
library(tidytuesdayR)

food_security <- readr::read_csv(
  'https://raw.githubusercontent.com/rfordatascience/tidytuesday/main/data/2025/2025-10-14/food_security.csv')

factor_foodsec <- as.factor(food_security$Item)
levels(factor_foodsec)
factor_foodsec <- as.factor(food_security$Area)
levels(factor_foodsec)
