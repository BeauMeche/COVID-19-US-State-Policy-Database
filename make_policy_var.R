library(tidyverse)
library(readxl)
library(janitor)

data1 <- read_excel("COVID-19 US state policy database 11_3_2020.xlsx",
                    sheet = 2,
                    col_names = T,
                    skip = 1)

var_descriptions <- read_excel("COVID-19 US state policy database 11_3_2020.xlsx",
                               sheet = 2)


data2 <- data1 %>% 
  clean_names() %>%
  # select(date_closed_k_12_public_schools) %>% 
  filter(!date_closed_k_12_public_schools %in% c("physical_distance_closure", "start", "date")) %>% 
  
  # another way to clean excel dates vvv
  # mutate(stemerg = as.Date(as.numeric(stemerg), origin = "1899-12-30"))
  
  mutate(k_12_closed = excel_numeric_to_date(as.numeric(date_closed_k_12_public_schools), 
                                             date_system = "modern")) %>% 
  select(- c(date_closed_k_12_public_schools))
  
# view(data1)

# currently sifting the var name descriptions to see what work is needed to finish cleaning this up

excel_numeric_to_date()