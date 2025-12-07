
## install.packages("tidytuesdayR")

library(dplyr)
library(tidyr)
library(broom)
library(purrr)
library(ggplot2)
library(stringr)
library(tidytuesdayR)
library(forcats)
```

food_security <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/main/data/2025/2025-10-14/food_security.csv')

food_security$Item <- as.factor(food_security$Item)
food_security$Area <- as.factor(food_security$Area)
View(food_security)
str(food_security)

```


## Selecting Data from south america

food_south <- food_security %>%
  filter(Area == c("Argentina", "Bolivia", "Brazil", "Chile","Colombia", "Ecuador",
                   "Guyana", "Paraguay", "Uruguay", "Peru", "Suriname", "Venezuela (Bolivarian Republic of)")  
  )
View(food_south)


adult_food <- food_south %>% 
  filter(Item %in% c(
    "Prevalence of moderate or severe food insecurity in the male adult population (percent) (3-year average)",
    "Prevalence of moderate or severe food insecurity in the female adult population (percent) (3-year average)",
    "Share of dietary energy supply derived from cereals, roots and tubers (percent) (3-year average)"
  )) %>% 
  select(Year_Start, Year_End, Area, Item, Value)

View(adult_food)


##Food insecurity female vs male and diet
adult_food %>% 
  ggplot(aes(x = fct_reorder(Area, Value), y = Value, fill = Item)) +
  geom_col(position = "dodge") +
  scale_fill_manual(name = "Food insecurity",
                    values = c(
                      "Prevalence of moderate or severe food insecurity in the male adult population (percent) (3-year average)" = "blue",
                      "Prevalence of moderate or severe food insecurity in the female adult population (percent) (3-year average)" = "limegreen",
                    "Share of dietary energy supply derived from cereals, roots and tubers (percent) (3-year average)" = "red"),
                    labels = c(
                      "Prevalence of moderate or severe food insecurity in the male adult population (percent) (3-year average)" = "Male",
                      "Prevalence of moderate or severe food insecurity in the female adult population (percent) (3-year average)" = "Female",
                      "Share of dietary energy supply derived from cereals, roots and tubers (percent) (3-year average)" = "Diet")) +
  labs(x = NULL,
       title = "Prevalence of adults facing severe or moderate food insecurity in South America",
       y = "Percent") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1),
        legend.direction = "vertical",
        legend.position = "bottom")

##code 2

library(ggplot2)
library(forcats)
library(dplyr)


##Each country to have only one diet row
adult_food_clean <- adult_food %>% 
  group_by(Area, Item) %>% 
  summarise(Value = mean(Value), .groups = "drop")


##Graph comparing food insecurity and diet composition

adult_food_clean %>% 
  ggplot(aes(
    x = fct_reorder(Area, Value),##reorder countries for readability
    y = Value,
    fill = Item
  )) +
 geom_col(position = position_dodge2(width = 0.85), width = 0.8) +
  geom_text(aes(label = round(Value, 1)), ##add numbers
            position = position_dodge2(width = 0.7), 
            vjust = -0.2,
            size = 3) +
  
  scale_fill_manual(
    name = "Indicator",
    values = c(
      "Prevalence of moderate or severe food insecurity in the female adult population (percent) (3-year average)" = "#009E73",
      "Prevalence of moderate or severe food insecurity in the male adult population (percent) (3-year average)" = "#0072B2",
      "Share of dietary energy supply derived from cereals, roots and tubers (percent) (3-year average)" = "#D55E00"
    ),
    labels = c(
      "Prevalence of moderate or severe food insecurity in the female adult population (percent) (3-year average)" = "Female",
      "Prevalence of moderate or severe food insecurity in the male adult population (percent) (3-year average)" = "Male",
      "Share of dietary energy supply derived from cereals, roots and tubers (percent) (3-year average)" = "Diet"
    )
  ) +
  
  labs(
    x = "",
    y = "Percent",
    title = "Food insecurity and carbohidrate rich diet in South America"
  ) +
  
  coord_flip() +
  theme_minimal(base_size = 14) +
  theme(
    legend.position = "bottom",
    axis.text.y = element_text(size = 11)
  )
