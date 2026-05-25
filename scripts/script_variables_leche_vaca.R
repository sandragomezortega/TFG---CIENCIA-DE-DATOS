leche <- read.csv("leche_vaca.csv",header=TRUE,sep="\t")
grep("energy|fat|sugar|protein",colnames(leche),value=TRUE)
library(dplyr)
library(tidyverse)
col_oficial <- c("nutrition.input_sets.packaging.as_sold.100ml.nutrients.energy.kcal.value","nutrition.input_sets.packaging.as_sold.100ml.nutrients.fat.value","nutrition.input_sets.packaging.as_sold.100ml.nutrients.saturated.fat.value","nutrition.input_sets.packaging.as_sold.100ml.nutrients.sugars.value","nutrition.input_sets.packaging.as_sold.100ml.nutrients.proteins.value","product_name_es","categories","categories_tags")
leche_vaca <- leche[,col_oficial]
col_oficial %in% names(leche)
leche_vaca <- leche[,col_oficial] %>%
  dplyr::rename ( kcal = nutrition.input_sets.packaging.as_sold.100ml.nutrients.energy.kcal.value, grasa = nutrition.input_sets.packaging.as_sold.100ml.nutrients.fat.value, grasa_saturadas = nutrition.input_sets.packaging.as_sold.100ml.nutrients.saturated.fat.value, azucar = nutrition.input_sets.packaging.as_sold.100ml.nutrients.sugars.value, proteinas = nutrition.input_sets.packaging.as_sold.100ml.nutrients.proteins.value,nombre_español = product_name_es, categoria = categories, categoria_tag = categories_tags)
leche_numeros <- leche_vaca %>%
  filter(!is.na(kcal) & !is.na(grasa) & !is.na(grasa_saturadas) & !is.na(azucar) & !is.na(proteinas))
leche_bebidas <- leche_numeros %>%
  filter(grepl("beverage|drink|milk|bebida|leche", categoria_tag, ignore.case = TRUE))
View(leche_bebidas)