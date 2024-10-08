# Load necessary library
library(tools)  # For file path functions

# Step 1: Define the path to the zip file and the destination folders
zip_file <- "//wsl.localhost/Ubuntu-24.04/home/manilpit/github/manilpit_github/mmn_r_lab/ND_barnevern_24/data/background/OneDrive_1_04-10-2024.zip"
unzipped_folder <- "//wsl.localhost/Ubuntu-24.04/home/manilpit/github/manilpit_github/mmn_r_lab/ND_barnevern_24/data/unzipped_u_fag"
unzipped_csv_folder <- "//wsl.localhost/Ubuntu-24.04/home/manilpit/github/manilpit_github/mmn_r_lab/ND_barnevern_24/data/unzipped_u_fag_csv"

# Step 2: Create the necessary folders if they don't exist
if (!dir.exists(unzipped_folder)) {
  dir.create(unzipped_folder, recursive = TRUE)
  print(paste("Created directory:", unzipped_folder))
}
if (!dir.exists(unzipped_csv_folder)) {
  dir.create(unzipped_csv_folder, recursive = TRUE)
  print(paste("Created directory:", unzipped_csv_folder))
}

# Step 3: Unzip the file into the unzipped folder
unzip(zip_file, exdir = unzipped_folder)

# Step 4: List all .txt files in the unzipped folder (case-insensitive) and exclude files with "fag" in the filename
txt_files <- list.files(path = unzipped_folder, pattern = "(?i)\\.txt$", full.names = TRUE)
txt_files <- txt_files[!grepl("fag", basename(txt_files), ignore.case = TRUE)]

# Step 5: Check if there are any .txt files to process after filtering
if (length(txt_files) == 0) {
  print("No .txt or .TXT files found in the unzipped folder after filtering out 'fag' files.")
} else {
  # Step 6: Process each .txt file, convert to .csv, and save in the unzipped_csv folder
  for (txt_file in txt_files) {
    
    # Extract the file name without extension
    file_name <- file_path_sans_ext(basename(txt_file))
    print(paste("Processing file:", file_name))
    
    # Read the .txt file (assuming tab-separated format)
    data <- read.table(txt_file, sep = "\t", header = FALSE, stringsAsFactors = FALSE, fill = TRUE)
    
    # Check if data was successfully read
    print("Preview of data read from the .txt file:")
    print(head(data))
    
    # Create the output file path in the 'unzipped_csv' folder with '_cleaned' suffix
    output_file <- file.path(unzipped_csv_folder, paste0(file_name, "_cleaned.csv"))
    
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
