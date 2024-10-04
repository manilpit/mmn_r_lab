# Load necessary libraries
library(dplyr)

# Assuming cleaned_fullsensur_v4 is already loaded
# Select the columns representing the 58 questions (columns named "1", "2", ..., "58")
question_columns <- cleaned_fullsensur_v4 %>% select(`1`:`58`)

# Initialize an empty data frame to store the counts for each question
summary_table <- data.frame(Question = character(),
                            Zero_Count = integer(),
                            One_Count = integer(),
                            Two_Count = integer(),
                            Missing_Count = integer(),
                            Total_Answers = integer(),
                            stringsAsFactors = FALSE)

# Loop through each question column and summarize the counts of 0, 1, 2, and NA
for (i in 1:58) {
  # Get the question column by name as a string
  question_data <- question_columns[[as.character(i)]]
  
  # Count the number of 0s, 1s, 2s, and missing values (NAs)
  count_zero <- sum(question_data == 0, na.rm = TRUE)
  count_one <- sum(question_data == 1, na.rm = TRUE)
  count_two <- sum(question_data == 2, na.rm = TRUE)
  count_na <- sum(is.na(question_data))
  
  # Total number of answers (non-missing values)
  total_answers <- sum(!is.na(question_data))
  
  # Add the counts to the summary table
  summary_table <- rbind(summary_table, data.frame(
    Question = paste("Question", i),
    Zero_Count = count_zero,
    One_Count = count_one,
    Two_Count = count_two,
    Missing_Count = count_na,
    Total_Answers = total_answers
  ))
}

# Display the summary table
summary_table

# If you want to view this table in RStudio or another R environment, you can use:
# View(summary_table)
