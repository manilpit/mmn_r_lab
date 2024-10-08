# Load the necessary package
library(dplyr)

# Step 1: Define the path to the 'unzipped_csv' folder
unzipped_csv_folder <- "//wsl.localhost/Ubuntu-24.04/home/manilpit/github/manilpit_github/mmn_r_lab/ND_barnevern_24/data/unzipped_csv"

# Step 2: Use list.files to list all .csv files in the 'unzipped_csv' folder
csv_files <- list.files(path = unzipped_csv_folder, pattern = "\\.csv$", full.names = TRUE)

# Step 3: Check if any .csv files were found
if (length(csv_files) == 0) {
  print("No .csv files found in the unzipped_csv folder.")
} else {
  # Step 4: Initialize an empty list to store data frames
  datasets_list <- list()
  
  # Step 5: Read each .csv file, ensure all columns are characters, and add it to the list
  for (csv_file in csv_files) {
    
    # Extract the file name
    file_name <- tools::file_path_sans_ext(basename(csv_file))
    print(paste("Reading file:", csv_file))
    
    # Read the .csv file and convert all columns to characters
    data <- read.csv(csv_file, stringsAsFactors = FALSE)
    data <- data %>% mutate(across(everything(), as.character))  # Convert all columns to character
    
    # Store the data frame in the list with the file name as the key
    datasets_list[[file_name]] <- data
  }
  
  # Step 6: Combine all datasets using bind_rows() to handle different column structures
  background_data_combined <- bind_rows(datasets_list, .id = "source")
  
  # Step 7: Preview the combined dataset
  print("Preview of the combined dataset:")
  print(head(background_data_combined))
  
  # Optional: Save the combined dataset as a new CSV file
  combined_output_file <- file.path(unzipped_csv_folder, "background_data_combined.csv")
  write.csv(background_data_combined, file = combined_output_file, row.names = FALSE)
  print(paste("Combined dataset successfully written to:", combined_output_file))
}

# End of script
