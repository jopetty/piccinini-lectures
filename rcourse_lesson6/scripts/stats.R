## READ IN DATA ####
source("scripts/cleaning.R")

## LOAD PACKAGES ####
library(lme4)

## ORGANIZE DATA ####
# Accuracy data
data_accuracy_stats = data_accuracy_clean

# Check within or between variables
xtabs(~subject_id+congruency+half, data_accuracy_stats)

xtabs(~item+congruency+half, data_accuracy_stats)

xtabs(~item+half, data_accuracy_stats)

## BUILD MODEL FOR ACCURACY ANALYSIS ####
# accuracy.glmer = glmer(accuracy ~ congruency * half +
#                          (1+congruency*half|subject_id) +
#                          (1+half|item), family = "binomial",
#                        data = data_accuracy_stats)

accuracy.glmer = glmer(accuracy ~ congruency * half +
                         (1|subject_id) +
                         (0+half|subject_id) +
                         (1|item), family = "binomial",
                       data = data_accuracy_stats)