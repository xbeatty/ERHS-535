library(ggplot2)
library(dplyr)
library(sf)
library(rnaturalearth)
library(viridis)

# Define fixed coordinate limits for South America
x_limits <- c(-82, -34)  # approx longitude range
y_limits <- c(-57, 13)   # approx latitude range

# Female map
p_female <- ggplot(map_joined %>% filter(sex == "Female")) +
  geom_sf(aes(fill = Value), color = "white") +
  scale_fill_viridis_c(option = "C", na.value = "grey80") +
  labs(
    title = "Female Food Insecurity (Moderate or Severe)",
    fill  = "Percent"
  ) +
  coord_sf(xlim = x_limits, ylim = y_limits, expand = FALSE) +
  theme_minimal()

# Male map
p_male <- ggplot(map_joined %>% filter(sex == "Male")) +
  geom_sf(aes(fill = Value), color = "white") +
  scale_fill_viridis_c(option = "D", na.value = "grey80") +
  labs(
    title = "Male Food Insecurity (Moderate or Severe)",
    fill  = "Percent"
  ) +
  coord_sf(xlim = x_limits, ylim = y_limits, expand = FALSE) +
  theme_minimal()

# Print both plots
p_female
p_male
