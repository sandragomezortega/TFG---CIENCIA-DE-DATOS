library(dplyr)
library(tidyverse)

contar_flujo <- function(archivo) {
  
  col_oficial <- c(
    "nutrition.input_sets.packaging.as_sold.100ml.nutrients.energy.kcal.value",
    "nutrition.input_sets.packaging.as_sold.100ml.nutrients.fat.value",
    "nutrition.input_sets.packaging.as_sold.100ml.nutrients.saturated.fat.value",
    "nutrition.input_sets.packaging.as_sold.100ml.nutrients.sugars.value",
    "nutrition.input_sets.packaging.as_sold.100ml.nutrients.proteins.value",
    "product_name_es",
    "categories",
    "categories_tags"
  )
  
  datos <- read.csv(archivo, header = TRUE, sep = "\t")
  
  inicial <- nrow(datos)
  
  datos_sel <- datos %>%
    select(all_of(col_oficial))
  
  completos <- datos_sel %>%
    filter(
      !is.na(nutrition.input_sets.packaging.as_sold.100ml.nutrients.energy.kcal.value) &
        !is.na(nutrition.input_sets.packaging.as_sold.100ml.nutrients.fat.value) &
        !is.na(nutrition.input_sets.packaging.as_sold.100ml.nutrients.saturated.fat.value) &
        !is.na(nutrition.input_sets.packaging.as_sold.100ml.nutrients.sugars.value) &
        !is.na(nutrition.input_sets.packaging.as_sold.100ml.nutrients.proteins.value)
    )
  
  bebidas_filtradas <- completos %>%
    filter(
      grepl("beverage|drink|milk|bebida|leche", categories_tags, ignore.case = TRUE) &
        !grepl("queso|cheese|yogur|yogurt|postre|dessert|cream|nata|condens|evaporat|powder|infantil|baby",
               categories_tags,
               ignore.case = TRUE)
    )
  
  tibble(
    inicial = inicial,
    tras_variables_completas = nrow(completos),
    tras_filtro_bebidas = nrow(bebidas_filtradas)
  )
} 
flujo_vaca <- contar_flujo("leche_vaca.csv")
flujo_soja <- contar_flujo("bebida_soja.csv")
flujo_almendra <- contar_flujo("bebida_almendra.csv")
flujo_avena <- contar_flujo("bebida_avena.csv")

flujo_total <- bind_rows(
  leche_vaca = flujo_vaca,
  soja = flujo_soja,
  almendra = flujo_almendra,
  avena = flujo_avena,
  .id = "categoria"
)

flujo_total_finales <- tibble(
  categoria = c("leche_vaca", "soja", "almendra", "avena"),
  final = c(nrow(vaca), nrow(soja), nrow(almendra), nrow(avena))
)

flujo_total <- flujo_total %>%
  left_join(flujo_total_finales, by = "categoria")

flujo_total <- flujo_total %>%
  mutate(
    excluidos_por_valores_incompletos = inicial - tras_variables_completas,
    excluidos_por_filtro_bebidas = tras_variables_completas - tras_filtro_bebidas,
    excluidos_por_revision_manual = tras_filtro_bebidas - final
  )

flujo_resumen <- flujo_total %>%
  summarise(
    productos_descargados = sum(inicial),
    excluidos_por_valores_incompletos = sum(excluidos_por_valores_incompletos),
    excluidos_por_filtro_bebidas = sum(excluidos_por_filtro_bebidas),
    excluidos_por_revision_manual = sum(excluidos_por_revision_manual),
    muestra_final = sum(final)
  )
flujo_total
flujo_resumen
print(flujo_resumen, width = Inf)
