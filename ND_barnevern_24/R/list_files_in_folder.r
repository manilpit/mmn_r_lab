# Step 1: Define the path to the "unzipped" folder in WSL
unzipped_folder <- "//wsl.localhost/Ubuntu-24.04/home/manilpit/github/manilpit_github/mmn_r_lab/ND_barnevern_24/data/unzipped"

# Step 2: Use list.files to list all .txt or .TXT files in the "unzipped" folder (case-insensitive)
txt_files <- list.files(path = unzipped_folder, pattern = "(?i)\\.txt$", full.names = TRUE)

# Step 3: Check if any .txt or .TXT files were found
if (length(txt_files) == 0) {
  print("No .txt or .TXT files found in the 'unzipped' folder.")
} else {
  # Step 4: Print the list of .txt or .TXT files
  print("List of .txt or .TXT files in the 'unzipped' folder:")
  print(txt_files)
}
