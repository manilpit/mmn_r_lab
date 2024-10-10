library(insperaAssignv2)
# Last inn nødvendige variabler
token <- get_access_token()

# Sett opp testparametrene
external_test_id <- "TEST_12345"  # Ekstern test-ID, denne kan være hva som helst unikt
title <- "Eksempel Test Opprettet fra Mal"
start_time <- format(Sys.time() + 3600, "%Y-%m-%dT%H:%M:%S.000Z")  # Start om 1 time
end_time <- format(Sys.time() + 7200, "%Y-%m-%dT%H:%M:%S.000Z")    # Slutt om 2 timer
duration <- 60  # Testens varighet i minutter
source_template_id <- 281618035  # Bruk ditt faktiske template-ID

# Kjør funksjonen for å opprette en ny test fra en mal
new_test_response <- create_new_test_from_template(
  external_test_id = external_test_id,
  title = title,
  start_time = start_time,
  end_time = end_time,
  duration = duration,
  source_template_id = source_template_id,
  token = token
)

# Skriv ut responsen for å se om testen ble opprettet
print(new_test_response)
