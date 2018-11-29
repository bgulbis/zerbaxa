library(tidyverse)
library(edwr)
library(openxlsx)

dir_raw <- "data/raw"

# MBO folder: Clinician Projects/Zerbaxa

# patients ---------------------------------------------

pts <- read_data2(dir_raw, "patients", FALSE)  %>%
    select(-millennium.id)

write.xlsx(pts, "data/external/zerbaxa_list_2015-01_2018-10.xlsx")

dirr::gzip_files()
