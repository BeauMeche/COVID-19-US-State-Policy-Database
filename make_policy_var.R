library(tidyverse)
library(readxl)
library(janitor)

data1 <- read_excel("COVID-19 US state policy database 11_3_2020.xlsx",
                    sheet = 2,
                    col_names = T)

var_descriptions <- read_excel("COVID-19 US state policy database 11_3_2020.xlsx",
                               sheet = 2)


data2 <- data1 %>% 
  filter(!STATE %in% c("category", "type", "unit", "State", NA)) %>% 
  clean_names() %>% 
  mutate(stemerg = as.Date(as.numeric(stemerg), origin = "1899-12-30"))
# view(data1)

# currently sifting the var name descriptions to see what work is needed to finish cleaning this up

