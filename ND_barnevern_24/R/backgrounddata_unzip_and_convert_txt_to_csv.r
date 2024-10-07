# Step 1: Define the path to the zip file and the destination folder
zip_file <- "//wsl.localhost/Ubuntu-24.04/home/manilpit/github/manilpit_github/mmn_r_lab/ND_barnevern_24/data/background/your_zip_file.zip"
unzipped_folder <- "//wsl.localhost/Ubuntu-24.04/home/manilpit/github/manilpit_github/mmn_r_lab/ND_barnevern_24/data/unzipped"

# Step 2: Unzip the file to the unzipped folder
unzip(zip_file, exdir = unzipped_folder)

# Step 3: Use list.files to list all .txt or .TXT files in the unzipped folder (case-insensitive)
txt_files <- list.files(path = unzipped_folder, pattern = "(?i)\\.txt$", full.names = TRUE)

# Step 4: Check if any .txt or .TXT files were found
if (length(txt_files) == 0) {
  print("No .txt or .TXT files found in the unzipped folder.")
} else {
  # Step 5: Convert each .txt file to a .csv file and save in the unzipped folder
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
    output_file <- file.path(unzipped_folder, paste0(file_name, "_cleaned.csv"))
    
    # Write the data to a new CSV file
    write.csv(data, file = output_file, row.names = FALSE)
    
    # Confirm the file has been written
    if (file.exists(output_file)) {
      print(paste("Successfully written to:", output_file))
    } else {
      print(paste("Failed to write file:", output_file))
    }
  }
}

# End of script
