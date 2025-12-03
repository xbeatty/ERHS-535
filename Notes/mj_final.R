library(tidyverse)
library(tidytuesdayR)
#use tigris color
#compare malnurished vs overweight kids line plots in 12 countries
#levels 14, 15
#xaxis as time and y-axis is measurement in % (mal and over)


food_security <- readr::read_csv(
  'https://raw.githubusercontent.com/rfordatascience/tidytuesday/main/data/2025/2025-10-14/food_security.csv')

factor_foodsec <- as.factor(food_security$Item)
levels(factor_foodsec)
factor_foodsec <- as.factor(food_security$Area)
levels(factor_foodsec)



children_df <- food_security %>%
  filter(str_detect(Item, regex("children", 
                                ignore_case = TRUE)))
