# Load necessary library
library(dplyr)

# Define the folder containing the cleaned CSV files
csv_folder <- "//wsl.localhost/Ubuntu-24.04/home/manilpit/github/manilpit_github/mmn_r_lab/ND_barnevern_24/data/unzipped_u_fag_csv"

# List all CSV files in the folder
csv_files <- list.files(path = csv_folder, pattern = "\\.csv$", full.names = TRUE)

# Check if any CSV files are found
if (length(csv_files) == 0) {
  print("No CSV files found in the 'unzipped_u_fag_csv' folder.")
} else {
  # Read and combine all CSV files into one dataset
  background_cleaned_ufag <- csv_files %>%
    lapply(function(file) {
      # Read each file as a character-only data frame to avoid type mismatches
      read.csv(file, stringsAsFactors = FALSE, colClasses = "character")
    }) %>%
    bind_rows()
  
  # Print a preview of the combined dataset
  print("Combined dataset 'background_cleaned_ufag':")
  print(head(background_cleaned_ufag))
  
  # Optionally save the combined dataset to a new CSV file or RData file
  # write.csv(background_cleaned_ufag, "//wsl.localhost/Ubuntu-24.04/home/manilpit/github/manilpit_github/mmn_r_lab/ND_barnevern_24/data/background_cleaned_ufag.csv", row.names = FALSE)
  # save(background_cleaned_ufag, file = "//wsl.localhost/Ubuntu-24.04/home/manilpit/github/manilpit_github/mmn_r_lab/ND_barnevern_24/data/background_cleaned_ufag.RData")
}

# End of script

