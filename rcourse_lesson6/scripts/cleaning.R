## LOAD PACKAGES ####
library(dplyr)
library(purrr)

## READ IN DATA
# Read in full results
data_results = list.files(path = "data/results", full.names = T) %>%
  map(read.table, header = T, sep="\t") %>%
  reduce(rbind)

# Read in extra data about specific subjects
data_subjects = read.table("data/rcourse_lesson6_data_subjects.txt", header=T, sep="\t")

# Read in extra data about specific items
data_items = read.table("data/rcourse_lesson6_data_items.txt", header=T, sep="\t")

## CLEAN DATA ####
# Fix and update columns for results data, combine with other data
# data_clean = data_results %>%
#   rename(trial_number = SimpleRTBLock.TrialNr.) %>%
#   rename(congruency = Congruency) %>%
#   rename(correct_response = StroopItem.CRESP.) %>%
#   rename(given_response = StroopItem.RESP.) %>%
#   rename(accuracy = StroopItem.ACC.) %>%
#   rename(rt = StroopItem.RT.)
# 
# data_clean = data_results %>%
#   rename(trial_number = SimpleRTBLock.TrialNr.) %>%
#   rename(congruency = Congruency) %>%
#   rename(correct_response = StroopItem.CRESP.) %>%
#   rename(given_response = StroopItem.RESP.) %>%
#   rename(accuracy = StroopItem.ACC.) %>%
#   rename(rt = StroopItem.RT.) %>%
#   select(subject_id, block, item, trial_number, congruency,
#          correct_response, given_response, accuracy, rt)
# 
# 
# data_clean = data_results %>%
#   rename(trial_number = SimpleRTBLock.TrialNr.) %>%
#   rename(congruency = Congruency) %>%
#   rename(correct_response = StroopItem.CRESP.) %>%
#   rename(given_response = StroopItem.RESP.) %>%
#   rename(accuracy = StroopItem.ACC.) %>%
#   rename(rt = StroopItem.RT.) %>%
#   select(subject_id, block, item, trial_number, congruency,
#          correct_response, given_response, accuracy, rt) %>%
#   inner_join(data_subjects) %>%
#   inner_join(data_items)

data_clean = data_results %>%
  rename(trial_number = SimpleRTBLock.TrialNr.) %>%
  rename(congruency = Congruency) %>%
  rename(correct_response = StroopItem.CRESP.) %>%
  rename(given_response = StroopItem.RESP.) %>%
  rename(accuracy = StroopItem.ACC.) %>%
  rename(rt = StroopItem.RT.) %>%
  select(subject_id, block, item, trial_number, congruency,
         correct_response, given_response, accuracy, rt) %>%
  inner_join(data_subjects) %>%
  inner_join(data_items) %>%
  mutate(half = ifelse(block == "one" | block == "two", "first", "second"))
