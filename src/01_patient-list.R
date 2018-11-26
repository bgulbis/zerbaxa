library(tidyverse)
library(edwr)
library(openxlsx)

dir_raw <- "data/raw"

# run MBO query
#   * Patients - by Medication (Generic) - Administration Date
#       - Medication (Generic): ceftolazone-tazobactam

pts <- read_data(dir_raw, "patients", FALSE) %>%
    as.patients()

mbo_id <- concat_encounters(pts$millennium.id)
print(mbo_id)

# run MBO query
#   * Identifiers - by Millennium Encounter Id

id <- read_data(dir_raw, "identifiers", FALSE) %>%
    as.id()

pts_list <- select(id, fin)

write.xlsx(pts_list, "data/external/zerbaxa_list_2015-01_2018-10.xlsx")
