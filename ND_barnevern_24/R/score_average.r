# Load necessary libraries
library(dplyr)

# Assuming cleaned_fullsensur_v4 is already loaded and "Vurdering" is the column with bestått and ikke bestått
vurdering_column <- "Vurdering"
total_column <- "Total"  # Replace "Total" with the correct name of the total score column

# Ensure all values in "Vurdering" are lowercase and remove any leading/trailing spaces
cleaned_fullsensur_v4[[vurdering_column]] <- tolower(trimws(cleaned_fullsensur_v4[[vurdering_column]]))

# Filter the data for bestått and ikke bestått, and calculate the mean of the total score for each group
average_bestaatt <- cleaned_fullsensur_v4 %>%
  filter(!!sym(vurdering_column) == "bestått") %>%
  summarize(Average_Score = mean(!!sym(total_column), na.rm = TRUE))

average_ikke_bestaatt <- cleaned_fullsensur_v4 %>%
  filter(!!sym(vurdering_column) == "ikke bestått") %>%
  summarize(Average_Score = mean(!!sym(total_column), na.rm = TRUE))

# Display the average scores for both groups
average_scores <- data.frame(
  Status = c("Bestått", "Ikke bestått"),
  Average_Score = c(average_bestaatt$Average_Score, average_ikke_bestaatt$Average_Score)
)

# Display the summary table
average_scores

# If you want to view this table in RStudio or another R environment, you can use:
# View(average_scores)
