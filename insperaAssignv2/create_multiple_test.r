# test_creation_script.R

library(insperaAssignv2)
library(lubridate)
library(dotenv)

# Load environment variables
load_dot_env()

# Fetch parameters from .env
template_id <- Sys.getenv("INSPERA_TEMPLATE_ID")
num_tests <- as.numeric(Sys.getenv("NUM_TESTS"))

# Validate environment variables
if (template_id == "") {
  stop("TEMPLATE_ID is not set in the .env file")
}

if (is.na(num_tests) || num_tests <= 0) {
  stop("NUM_TESTS is not set properly in the .env file")
}

# Other test parameters
external_test_id_prefix <- "test"
title_prefix <- "Test Exam"
start_time <- "2023-06-01T09:00:00Z"
duration <- 120  # in minutes
gap_between_tests <- 30  # in minutes

cat("Creating", num_tests, "tests using template ID:", template_id, "\n\n")

# Call the function to create multiple tests
results <- create_multiple_tests(
  template_id = template_id,
  external_test_id_prefix = external_test_id_prefix,
  title_prefix = title_prefix,
  start_time = start_time,
  duration = duration,
  gap_between_tests = gap_between_tests
)

# Check the results
if (!is.null(results) && length(results) > 0) {
  cat("Tests created successfully!\n")
  cat("Number of tests created:", length(results), "\n\n")
  
  for (i in seq_along(results)) {
    cat("Test", i, "details:\n")
    cat("Assessment Run ID:", results[[i]]$assessmentRunId, "\n")
    cat("External Test ID:", results[[i]]$externalTestId, "\n")
    cat("Title:", results[[i]]$title, "\n")
    cat("Start Time:", results[[i]]$startTime, "\n")
    cat("End Time:", results[[i]]$endTime, "\n")
    cat("Status:", results[[i]]$status, "\n\n")
  }
} else {
  cat("Failed to create tests.\n")
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