setwd("./SEDEMA/PROAIRE")
library("tidyverse")

datos<-read.csv("datosIC.csv", header = T, stringsAsFactors = F)

datos2<-datos %>%
  mutate(ICpm25 = case_when(Row == Rowpm25 ~ paste0(round(pm25, 0)*-1, " (",
                                                    round(pm25.p25, 0)*-1, ", ",
                                                    round(pm25.p975, 0)*-1, ")"),
                            TRUE ~ NA_character_),
         ICno2 = case_when(Row == Rowno2 ~ paste0(round(no2, 0)*-1, " (",
                                                    round(no2.p25, 0)*-1, ", ",
                                                    round(no2.p975, 0)*-1, ")"),
                            TRUE ~ NA_character_),
         ICo31h = case_when(Row == Rowo31h ~ paste0(round(o31h, 0)*-1, " (",
                                                    round(o31h.p25, 0)*-1, ", ",
                                                    round(o31h.p975, 0)*-1, ")"),
                            TRUE ~ NA_character_),
         ICo38h = case_when(Row == Rowo38h ~ paste0(round(o38h, 0)*-1, " (",
                                                    round(o38h.p25, 0)*-1, ", ",
                                                    round(o38h.p975, 0)*-1, ")"),
                            TRUE ~ NA_character_)) %>%
  select(NOM_ENT, NOMBRE, ICpm25, ICno2, ICo31h, ICo38h) %>%
  write.csv("tablaIC_raw.csv", row.names = F)

#Vamos a editar de ejemplo este archivo
objeto<-c(1,2,3,4,5)
