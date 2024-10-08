# Skriv ut navnene på alle kolonnene i datasettet
print("Kolonner i datasettet background_data_combined:")
print(colnames(background_data_combined))

# Hent ut hele kolonnen v7
v7_column <- background_data_combined$V7

# Skriv ut kolonnen v7
print("Innholdet i kolonnen v7:")
print(v7_column)


library(dplyr)

# Finn unike verdier i kolonnen V7 og tell antall forekomster av hver
unique_V7_counts <- background_data_combined %>%
  count(V7, name = "count") %>%
  arrange(desc(count))

# Skriv ut resultatet
print("Unike verdier i kolonnen V7 og antall forekomster av hver:")
print(unique_V7_counts)