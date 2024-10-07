# Script to transform all .txt files in the unzipped folder into CSVs with the specified format

# Step 1: Define the path to the folder where the .txt files are located
unzipped_folder <- "//wsl.localhost/Ubuntu-24.04/home/manilpit/github/manilpit_github/mmn_r_lab/ND_barnevern_24/data/unzipped"

# Step 2: Use list.files to list all .txt or .TXT files in the unzipped folder (case-insensitive)
txt_files <- list.files(path = unzipped_folder, pattern = "(?i)\\.txt$", full.names = TRUE)

# Step 3: Check if any .txt or .TXT files were found
if (length(txt_files) == 0) {
  print("No .txt or .TXT files found in the unzipped folder.")
} else {
  # Step 4: Process each .txt file and apply the formatting
  for (txt_file in txt_files) {
    
    # Extract the file name without extension
    file_name <- tools::file_path_sans_ext(basename(txt_file))
    print(paste("Processing file:", file_name))
    
    # Step 5: Read the .txt file (assuming tab-separated)
    data <- read.table(txt_file, sep = "\t", header = FALSE, stringsAsFactors = FALSE, fill = TRUE)
    
    # Step 6: Apply the specific column format based on the given line structure
    colnames(data) <- c("ID", "CourseCode", "Term", "Grade", "Year", "Period", "StudentID", "ProgramCode", 
                        "ProgramName", "Year2", "Semester", "Campus", "CourseCode2", "CourseName", "Type",
                        "ProgramType", "Credits", "CourseCode3", "CourseName3", "Empty1", "Empty2", 
                        "SomeScore", "Empty3", "Empty4", "NumStudents", "Empty5", "GradeLetter", 
                        "CreditsCompleted", "Empty6", "Empty7", "ProgramCode2", "ProgramName2")
    
    # Preview the formatted data
    print("Preview of formatted data:")
    print(head(data))
    
    # Step 7: Create the output file path with '_formatted' suffix
    output_file <- file.path(unzipped_folder, paste0(file_name, "_formatted.csv"))
    
    # Step 8: Write the data to a new CSV file with the specified format
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
