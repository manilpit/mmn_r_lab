# Load necessary libraries
library(dplyr)

# Step 1: Define the folder paths (updated input path)
input_folder <- "//wsl.localhost/Ubuntu-24.04/home/manilpit/github/manilpit_github/mmn_r_lab/ND_barnevern_24/data/background/OneDrive_1_04-10-2024"
output_folder <- "//wsl.localhost/Ubuntu-24.04/home/manilpit/github/manilpit_github/mmn_r_lab/ND_barnevern_24/data/background/cleaned_csv_files"

# Step 2: Create output folder if it doesn't exist
if (!dir.exists(output_folder)) {
  dir.create(output_folder)
  print("Output folder created.")
} else {
  print("Output folder already exists.")
}

# Step 3: Get a list of all .txt files in the input folder (using case-insensitive pattern matching)
txt_files <- list.files(input_folder, pattern = "(?i)\\.txt$", full.names = TRUE)

# Check if any files are detected
print("Files detected:")
print(txt_files)

if (length(txt_files) == 0) {
  print("No .txt files found in the input folder. Please check the path or file existence.")
} else {
  # Step 4: Initialize a list to store the datasets
  datasets_list <- list()
  
  # Step 5: Process each .txt file, convert to CSV, and load as dataset
  for (txt_file in txt_files) {
    
    # Extract the file name without extension
    file_name <- tools::file_path_sans_ext(basename(txt_file))
    print(paste("Processing file:", file_name))
    
    # Read the .txt file (assuming tab-separated or adjust as needed)
    data <- read.table(txt_file, sep = "\t", header = FALSE, stringsAsFactors = FALSE, fill = TRUE)
    
    # Check if data was successfully read
    print("Preview of data read from the .txt file:")
    print(head(data))
    
    # Create the output file path with '_cleaned' suffix
    output_file <- file.path(output_folder, paste0(file_name, "_cleaned.csv"))
    
    # Write the data to a new CSV file
    write.csv(data, file = output_file, row.names = FALSE)
    
    # Confirm the file has been written
    if (file.exists(output_file)) {
      print(paste("Successfully written to:", output_file))
    } else {
      print(paste("Failed to write file:", output_file))
    }
    
    # Load the CSV file back into R as a dataset
    cleaned_data <- read.csv(output_file, stringsAsFactors = FALSE)
    
    # Store the dataset in the list with the file name as the key
    datasets_list[[paste0(file_name, "_cleaned")]] <- cleaned_data
  }
  
  # Step 6: Print the names of all datasets loaded
  print("Datasets loaded:")
  print(names(datasets_list))
}
