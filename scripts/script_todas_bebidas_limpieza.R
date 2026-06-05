library(dplyr)
library(tidyverse)

bebidas <- function (archivo) {
  col_oficial <- c("nutrition.input_sets.packaging.as_sold.100ml.nutrients.energy.kcal.value","nutrition.input_sets.packaging.as_sold.100ml.nutrients.fat.value","nutrition.input_sets.packaging.as_sold.100ml.nutrients.saturated.fat.value","nutrition.input_sets.packaging.as_sold.100ml.nutrients.sugars.value","nutrition.input_sets.packaging.as_sold.100ml.nutrients.proteins.value","product_name_es","categories","categories_tags")

  read.csv(archivo,header=TRUE,sep="\t") %>%
    select(all_of(col_oficial)) %>%
    rename(kcal = nutrition.input_sets.packaging.as_sold.100ml.nutrients.energy.kcal.value, grasa = nutrition.input_sets.packaging.as_sold.100ml.nutrients.fat.value, grasa_saturadas = nutrition.input_sets.packaging.as_sold.100ml.nutrients.saturated.fat.value, azucar = nutrition.input_sets.packaging.as_sold.100ml.nutrients.sugars.value, proteinas = nutrition.input_sets.packaging.as_sold.100ml.nutrients.proteins.value,nombre_español = product_name_es, categoria = categories, categoria_tag = categories_tags) %>%
    filter(!is.na(kcal) & !is.na(grasa) & !is.na(grasa_saturadas) & !is.na(azucar) & !is.na(proteinas)) %>%
    filter(grepl("beverage|drink|milk|bebida|leche", categoria_tag, ignore.case = TRUE) & !grepl("queso|cheese|yogur|yogurt|postre|dessert|cream|nata|condens|evaporat|powder|infantil|baby",categoria_tag,ignore.case = TRUE))
}

vaca <- bebidas("leche_vaca.csv")
soja <- bebidas("bebida_soja.csv") %>% filter(!grepl("haverdrink|oat-based-drinks|coconut-based-drinks|carbonated-drinks|sodas",categoria_tag,ignore.case = TRUE)
)
almendra <- bebidas("bebida_almendra.csv")
avena <- bebidas("bebida_avena.csv")

View(vaca)
View(soja)
View(almendra)
View(avena)

write.csv(vaca,"vaca.csv", row.names = FALSE)
write.csv(avena,"avena.csv", row.names = FALSE)
write.csv(soja,"soja.csv", row.names = FALSE)
write.csv(almendra,"almendra.csv", row.names = FALSE)

