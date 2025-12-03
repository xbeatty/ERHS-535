##Andrea File
```{r selecting for ???}
##Filter

library(dplyr)
library(stringr)

food_south <- food_security %>%
  mutate(Area = "Argentina") 

View(food_south)