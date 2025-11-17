# Using R
# Option 1: tidytuesdayR R package 
## install.packages("tidytuesdayR")

library(tidyverse)

tuesdata <- tidytuesdayR::tt_load('2025-11-04')

flint_mdeq <- tuesdata$flint_mdeq
flint_vt <- tuesdata$flint_vt


# Set the data directory. Change this if your data is in a different location.
data_dir <- "tt_submission"  # Expected structure: data_dir contains test12187-supp-0001-flint.rdata

load(data_dir, "test12187-supp-0001-flint.rdata")

# add notes

flint_mdeq <- flint_mdeq %>% 
  mutate(notes = case_when(lead == 104 & is.na(lead2) ~ "sample removed: house had a filter",
                           lead == 20 & is.na(lead2) ~ "sample removed: business not residence"))
