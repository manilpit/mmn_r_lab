# Install the readODS package if not already installed
# install.packages("readODS")

# Load the readODS package
library(readODS)

# Define the file paths for the cleaned datasets
file_path_cleaned_v4 <- "//wsl.localhost/Ubuntu-24.04/home/manilpit/github/manilpit_github/mmn_r_lab/ND_barnevern_24/data/exams/cleaned_fullsensur_v24.ods"
file_path_cleaned_v3 <- "//wsl.localhost/Ubuntu-24.04/home/manilpit/github/manilpit_github/mmn_r_lab/ND_barnevern_24/data/exams/cleaned_fullsensur_v24.ods"

# Read the ODS files
cleaned_fullsensur_v4 <- read_ods(file_path_cleaned_v4)
cleaned_fullsensur_v3 <- read_ods(file_path_cleaned_v3)

# View the data (optional)
View(cleaned_fullsensur_v4)
View(cleaned_fullsensur_v3)
