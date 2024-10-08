library(dplyr)

# Sjekk antall unike verdier i kolonnen V7
unique_count <- background_cleaned_ufag %>%
  summarise(unique_values = n_distinct(V7))

print("Antall unike verdier i kolonnen V7:")
print(unique_count)

# Finn antall ganger hver verdi er duplisert og lagre resultatet i v7_duplicate
v7_duplicate <- background_cleaned_ufag %>%
  count(V7) %>%
  arrange(desc(n))

print("Antall ganger hver verdi er duplisert i kolonnen V7:")
print(v7_duplicate)
