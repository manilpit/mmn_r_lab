# Load necessary libraries
library(dplyr)

# Assuming cleaned_fullsensur_v4 is already loaded
# Select the columns representing the 58 questions (columns named "1", "2", ..., "58")
question_columns <- cleaned_fullsensur_v4 %>% select(`1`:`58`)

# Initialize an empty data frame to store the counts for each question
summary_table <- data.frame(Question = character(),
                            Zero_Count = integer(),
                            One_Count = integer(),
                            Total_Responses = integer(),  # To account for total rows
                            stringsAsFactors = FALSE)

# Loop through each question column and summarize the counts of 0 and 1
for (i in 1:58) {
  # Get the question column by name as a string
  question_data <- question_columns[[as.character(i)]]
  
  # Count the number of 0s, 1s, and total non-NA responses
  count_zero <- sum(question_data == 0, na.rm = TRUE)
  count_one <- sum(question_data == 1, na.rm = TRUE)
  total_responses <- sum(!is.na(question_data))  # Count all non-NA responses
  
  # Add the counts to the summary table
  summary_table <- rbind(summary_table, data.frame(
    Question = paste("Question", i),
    Zero_Count = count_zero,
    One_Count = count_one,
    Total_Responses = total_responses  # Add the total number of responses
  ))
}

# Display the summary table
summary_table

# If you want to view this table in RStudio or another R environment, you can use:
# View(summary_table)
