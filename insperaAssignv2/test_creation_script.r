# test_creation_script.R

library(insperaAssignv2)

# Test parameters
template_id <- "your_template_id"  # Replace with a valid template ID
external_test_id <- "test_001"  # Replace with a unique external test ID
title <- "Test Exam 001"
start_time <- "2023-06-01T09:00:00Z"
end_time <- "2023-06-01T11:00:00Z"
duration <- 120  # in minutes

# Call the function
result <- create_new_test(
  template_id = template_id,
  external_test_id = external_test_id,
  title = title,
  start_time = start_time,
  end_time = end_time,
  duration = duration
)

# Check the result
if (!is.null(result)) {
  cat("Test created successfully!\n")
  cat("Assessment Run ID:", result$assessmentRunId, "\n")
  cat("Status:", result$status, "\n")
  print(result)  # Print the entire result for inspection
} else {
  cat("Failed to create test.\n")
}

# Check if the metadata file was created
today_date <- format(Sys.Date(), "%Y-%m-%d")
metadata_file <- paste0(today_date, "_test_created.csv")

if (file.exists(metadata_file)) {
  cat("Metadata file created:", metadata_file, "\n")
  # Read and print the contents
  metadata <- readr::read_csv(metadata_file)
  print(metadata)
} else {
  cat("Metadata file not found.\n")
}