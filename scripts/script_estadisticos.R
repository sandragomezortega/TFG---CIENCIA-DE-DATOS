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
todas$tipo <- as.factor(todas$tipo)
library(dplyr)
library(tidyr)
library(rstatix)
library(writexl)

variables <- c("kcal", "grasa", "grasa_saturadas", "azucar", "proteinas")

datos_estadisticos <- todas |>
  pivot_longer(
    cols = all_of(variables),
    names_to = "nutriente",
    values_to = "valor"
  )

normalidad <- datos_estadisticos |>
  group_by(nutriente, tipo) |>
  shapiro_test(valor)

levene_resultados <- datos_estadisticos |>
  group_by(nutriente) |>
  levene_test(valor ~ tipo)

anova_resultados <- datos_estadisticos |>
  group_by(nutriente) |>
  anova_test(valor ~ tipo)

kruskal_resultados <- datos_estadisticos |>
  group_by(nutriente) |>
  kruskal_test(valor ~ tipo)

eta_kruskal <- datos_estadisticos |>
  group_by(nutriente) |>
  kruskal_effsize(valor ~ tipo)

dunn_resultados <- datos_estadisticos |>
  group_by(nutriente) |>
  dunn_test(valor ~ tipo, p.adjust.method = "BH")
write_xlsx(
  list(
    normalidad = normalidad,
    levene = levene_resultados,
    anova = anova_resultados,
    kruskal = kruskal_resultados,
    eta_kruskal = eta_kruskal,
    dunn = dunn_resultados
  ),
  "Analisis_Estadistico.xlsx"
)
