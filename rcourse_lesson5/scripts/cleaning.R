## LOAD PACKAGES ####
library(dplyr)
library(purrr)

## READ IN DATA ####
# Full data on election results
data_election_results = list.files(path = "data/elections", full.names = T) %>%
  map(read.table, header = T, sep = "\t") %>%
  reduce(rbind)

# Read in extra data about specific elections
data_elections = read.table("data/rcourse_lesson5_data_elections.txt", header=T, sep="\t")

# Read in extra data about specific states
data_states = read.table("data/rcourse_lesson5_data_states.txt", header=T, sep="\t")

# See how many states in union versus confederacy
xtabs(~civil_war, data_states)