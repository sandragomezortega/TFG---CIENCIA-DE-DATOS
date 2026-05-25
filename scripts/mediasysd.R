almendra <- read.csv("almendra.csv")
avena <- read.csv("avena.csv")
soja <- read.csv("soja.csv")
vaca <- read.csv("vaca.csv")

almendra |> str()
avena |> str()
soja |> str()
vaca |> str()

almendra$tipo <- "Bebida de almendra"
avena$tipo <- "Bebida de avena"
soja$tipo <- "Bebida de soja"
vaca$tipo <- "Leche de vaca"

todas <- bind_rows(almendra,avena,soja,vaca)

todas |> count(tipo)

descriptivos <- todas |> 
  group_by(tipo) |> 
  summarise(
    n = n(),
    kcal_media = mean(kcal,na.rm = TRUE),
    kcal_sd = sd(kcal,na.rm = TRUE),
    grasa_total_media = mean(grasa,na.rm = TRUE),
    grasa_total_sd = sd(grasa,na.rm = TRUE),
    grasa_saturada_media = mean(grasa_saturadas, na.rm = TRUE),
    grasa_saturada_sd = sd(grasa_saturadas, na.rm = TRUE),
    azucar_media = mean(azucar,na.rm = TRUE),
    azucar_sd = sd(azucar,na.rm = TRUE),
    proteina_media = mean(proteinas,na.rm = TRUE),
    proteina_sd = sd(proteinas,na.rm = TRUE)
  ) |>
  mutate(across(where(is.numeric),~ round(.x,2)))

library(writexl)
write_xlsx(descriptivos, "Tabla1_Descriptivos.xlsx")
