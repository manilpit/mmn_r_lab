# Script: check_duplicates_in_v1_v2_and_missing.R

# Step 1: Define the path to the unzipped folder
unzipped_folder <- "//wsl.localhost/Ubuntu-24.04/home/manilpit/github/manilpit_github/mmn_r_lab/ND_barnevern_24/data/unzipped"

# Step 2: Use list.files to list all .txt or .TXT files in the unzipped folder (case-insensitive)
txt_files <- list.files(path = unzipped_folder, pattern = "(?i)\\.txt$", full.names = TRUE)

# Step 3: Check if any .txt or .TXT files were found
if (length(txt_files) == 0) {
  print("No .txt or .TXT files found in the unzipped folder.")
} else {
  # Step 4: For each .txt file, check for duplicates in v1 and v2, and missing values
  for (txt_file in txt_files) {
    
    # Extract the file name without extension
    file_name <- tools::file_path_sans_ext(basename(txt_file))
    print(paste("Processing file:", file_name))
    
    # Read the .txt file (assuming tab-separated or adjust as needed)
    data <- read.table(txt_file, sep = "\t", header = FALSE, stringsAsFactors = FALSE, fill = TRUE)

    # Rename columns for clarity (assuming columns are named v1, v2, ...)
    colnames(data) <- paste0("v", seq_len(ncol(data)))
    
    # Check if data was successfully read
    print("Preview of data read from the .txt file:")
    print(head(data))
    
    # Check for duplicates in v1 and v2 only
    duplicate_rows <- data[duplicated(data[, c("v1", "v2")]), ]
    if (nrow(duplicate_rows) > 0) {
      print(paste("Duplicates found in", file_name, "based on v1 and v2:"))
      print(duplicate_rows)
    } else {
      print(paste("No duplicates found in", file_name, "based on v1 and v2"))
    }
    
    # Check for missing values (NAs)
    missing_values <- colSums(is.na(data))
    if (sum(missing_values) > 0) {
      print(paste("Missing values found in", file_name, ":"))
      print(missing_values)
    } else {
      print(paste("No missing values found in", file_name))
    }
  }
}

# End of script
