library(dplyr)
library(ggplot2)
library(forcats)

children_food_clean <- children_food %>%
  mutate(
    Area = as.character(Area),  # ensure it's character
    Area = str_replace(Area, " \\(Bolivarian Republic of\\)", "")  # remove parentheses
  )

ggplot(children_food_clean, aes(y = fct_reorder(Area, Value), x = Value, fill = Item)) +
  geom_col(position = "dodge") +
  scale_fill_manual(
    name = "Observation",
    values = c(
      "Number of children under 5 years of age who are overweight (modeled estimates) (million)" = "blue",
      "Number of children under 5 years of age who are stunted (modeled estimates) (million)" = "limegreen"
    ),
    labels = c(
      "Number of children under 5 years of age who are overweight (modeled estimates) (million)" = "Overweight",
      "Number of children under 5 years of age who are stunted (modeled estimates) (million)" = "Stunted"
    )
  ) +
  labs(
    y = NULL,
    x = "Number of Children (millions)",
    title = "Nutrition in South American Children Under 5"
  ) +
  theme_minimal() +
  theme(
    legend.direction = "vertical",
    legend.position = "right"
  )

