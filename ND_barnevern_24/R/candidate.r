# Define the correct column name for candidates
candidate_column <- "Kandidat"

# Count the number of unique candidates
num_candidates <- cleaned_fullsensur_v4 %>%
  select(candidate_column) %>%
  distinct() %>%
  nrow()

# Display the number of candidates
num_candidates
