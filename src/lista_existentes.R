#!/usr/bin/env Rscript

library(dplyr)
library(tidyr)
library(purrr)
library(jsonlite)

federais = fromJSON("https://api.dadosjusbr.org/uiapi/v1/orgao/Federal")$Agency$Name

pb = fromJSON("https://api.dadosjusbr.org/uiapi/v1/orgao/PB")$Agency$Name

orgaos_lugar <- function(lugar){
  message("Procurando órgãos: ", lugar)
  url_lugar = stringr::str_glue("https://api.dadosjusbr.org/uiapi/v1/orgao/{lugar}")
  jsonlite::fromJSON(url_lugar)$Agency$Name
}

cobertos = c("Federal", "AL", "BA", "CE", "ES", "GO", "MA", "MG", "PB", "PR", "PE", "PI", "RN", "RS", "RJ", "SP", "SE", "TO")

existem = tibble(local = cobertos) %>% 
  mutate(orgao = map(local, orgaos_lugar))

existem %>% 
  unnest(orgao) %>% 
  readr::write_csv(here::here("dados/ready/orgaos-cobertos.csv"))

