library(tidyverse)
library(tidytuesdayR)
library(ggplot2)
library(ggthemes)
library(forcats)
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

children_food <- food_south %>% 
  filter(Item %in% c(
    "Number of children under 5 years of age who are overweight (modeled estimates) (million)", 
    "Number of children under 5 years of age who are stunted (modeled estimates) (million)")) %>% 
  select(Year_Start, Year_End, Area, Item, Value)

children_food %>% 
  ggplot(aes(x = fct_reorder(Area, Value), y = Value, fill = Item)) +
  geom_col(position = "dodge") +
  scale_fill_manual(name = "Child Condition",
    values = c(
      "Number of children under 5 years of age who are overweight (modeled estimates) (million)" = "blue",
      "Number of children under 5 years of age who are stunted (modeled estimates) (million)" = "limegreen"),
    labels = c(
      "Number of children under 5 years of age who are overweight (modeled estimates) (million)" = "Overweight",
      "Number of children under 5 years of age who are stunted (modeled estimates) (million)" = "Stunted")) +
  labs(x = NULL,
       title = "Number of Children Modeled to be Overweight or Stunted",
       y = "Number of Children (millions)") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1),
        legend.direction = "vertical",
        legend.position = "bottom")
  
#possibility of adding facet_wrap by Item too, separte overweight and stunted

#individual graphs made- I dont think needed if I can do facet_wrap above
overweight <- children_food %>%
  filter(Item == "Number of children under 5 years of age who are overweight (modeled estimates) (million)") %>% 
  select(Year_Start, Year_End, Area, Item, Value)
stunted <- children_food %>% 
  filter(Item == "Number of children under 5 years of age who are stunted (modeled estimates) (million)") %>% 
  select(Year_Start, Year_End, Area, Item, Value)

overweight %>% 
  ggplot(aes(x = fct_reorder(Area, Value), y = Value, fill = Area)) +
  geom_col() +
  theme(legend.position = "none") +
  labs(title = "Number of children under 5 overweight")

stunted %>% 
  ggplot(aes(x = fct_reorder(Area, Value), y = Value, fill = Area)) +
  geom_col() +
  theme(legend.position = "none") +
  labs(title = "Number of children under 5 overweight")


install.packages("flexdashboard")
library(flexdashboard)

