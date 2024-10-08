# Step 1: Specify the path to your CSV file
csv_file_path <- "//wsl.localhost/Ubuntu-24.04/home/manilpit/github/manilpit_github/mmn_r_lab/ND_barnevern_24/data/background/HINN-BAV4001v2.csv"

# Step 2: Read the CSV file into a data frame in R
bakgrunn <- read.csv(csv_file_path, stringsAsFactors = FALSE)

# Step 3: View the first few rows to check the data
head(dataset)
