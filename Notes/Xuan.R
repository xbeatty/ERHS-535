kp_indicator <- "Prevalence of moderate or severe food insecurity in the total population (percent) (3-year average)"

kp_ts_all <- food_south %>%
  filter(Item == kp_indicator) %>%
  arrange(Area, Year_End)

p_ts_facets <- ggplot(
  kp_ts_all,
  aes(
    x = Year_End,
    y = Value,
    group = Area,
    text = paste0(
      "Area: ", Area,
      "<br>Year_End: ", Year_End,
      "<br>Value: ", round(Value, 2), " ", Unit
    )
  )
) +
  geom_line(color = "steelblue") +
  geom_point(color = "steelblue") +
  facet_wrap(~ Area) +
  labs(
    x = "Year_End",
    y = "Percent",
    title = "Trend in food insecurity by country"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)
  )

ggplotly(p_ts_facets, tooltip = "text")

