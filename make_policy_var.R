library(tidyverse)
library(readxl)

data1 <- read_excel("COVID-19 US state policy database 11_3_2020.xlsx",
                    sheet = 2)

var_descriptions <- read_excel("COVID-19 US state policy database 11_3_2020.xlsx",
                               sheet = 2)

view(data1)
