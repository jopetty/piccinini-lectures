#install.packages("tidyr")
#install.packages("ez")

## READ IN DATA ####
source("scripts/cleaning.R")

## LOAD PACKAGES ####
library(tidyr)
library(ez)

## ORAGANIZE DATA ####
# Make data for statistics
data_stats = data_clean %>%
  mutate(civil_war = factor(civil_war, levels = c("union", "confederacy"))) %>%
  group_by(state, incumbent_party, civil_war) %>%
  summarise(perc_incumbent_mean = mean(perc_votes_incumbent, na.rm = T)) %>%
  ungroup()

# Check if incumbent party is within-state
xtabs(~state+incumbent_party, data_stats)

# Check if civil war is within-state
xtabs(~state+civil_war, data_stats)