# Load necessary libraries
library(dplyr)

# Assuming cleaned_fullsensur_v4 is already loaded and "Vurdering" is the column with bestått and ikke bestått
vurdering_column <- "Vurdering"

# Ensure all values are lowercase and remove any leading/trailing spaces
cleaned_fullsensur_v4[[vurdering_column]] <- tolower(trimws(cleaned_fullsensur_v4[[vurdering_column]]))

# Count the number of "bestått" and "ikke bestått"
bestaatt_count <- sum(cleaned_fullsensur_v4[[vurdering_column]] == "bestått", na.rm = TRUE)
ikke_bestaatt_count <- sum(cleaned_fullsensur_v4[[vurdering_column]] == "ikke bestått", na.rm = TRUE)

# Create a summary table
bestaatt_summary <- data.frame(
  Status = c("Bestått", "Ikke bestått"),
  Count = c(bestaatt_count, ikke_bestaatt_count)
)

# Display the summary table
bestaatt_summary

# If you want to view this table in RStudio or another R environment, you can use:
# View(bestaatt_summary)
