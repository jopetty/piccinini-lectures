## READ IN DATA ####
source("scripts/cleaning.R")

## LOAD PACKAGES ####
library(ggplot2)

## ORGANIZE DATA ####
data_figs = data_clean %>%
  mutate(civil_war = factor(civil_war,
                            levels = c("union", "confederacy"),
                            labels = c("Union", "Confederacy"))) %>%
  mutate(incumbent_party = factor(incumbent_party,
                                  levels = c("democrat", "republican"),
                                  labels = c("Democrat", "Republican")))

## MAKE FIGURES ####
# Histogram of full data set
incumbent_histogram_full.plot = ggplot(data_figs, aes(x = perc_votes_incumbent,
                                                      fill = incumbent_party)) +
  geom_histogram(bins = 10) +
  facet_grid(incumbent_party ~ civil_war) +
  scale_fill_manual(values = c("blue", "red"))

pdf("figures/incumbent_histogram_full.pdf")
incumbent_histogram_full.plot
dev.off()