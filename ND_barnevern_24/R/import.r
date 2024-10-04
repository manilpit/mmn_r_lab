# Install the readxl package if not already installed
# install.packages("readxl")

# Load the readxl package
library(readxl)

# Define the file paths (adjust these paths as per your file location)
file_path_v24 <- "//wsl.localhost/Ubuntu-24.04/home/manilpit/github/manilpit_github/mmn_r_lab/ND_barnevern_24/data/exams/Fullsensur_v23.xlsx"
file_path_v23 <- "//wsl.localhost/Ubuntu-24.04/home/manilpit/github/manilpit_github/mmn_r_lab/ND_barnevern_24/data/exams/Fullsensur_v24.xlsx"

# Read the Excel files
fullsensur_v24 <- read_excel(file_path_v24)
fullsensur_v23 <- read_excel(file_path_v23)

# View the data (optional)
View(fullsensur_v24)
View(fullsensur_v23)
