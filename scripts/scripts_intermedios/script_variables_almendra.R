almendra <- read.csv("bebida_almendra.csv",header=TRUE,sep="\t")
grep("energy|fat|sugar|protein",colnames(almendra),value=TRUE)
library(dplyr)
library(tidyverse)
col_oficial <- c("nutrition.input_sets.packaging.as_sold.100ml.nutrients.energy.kcal.value","nutrition.input_sets.packaging.as_sold.100ml.nutrients.fat.value","nutrition.input_sets.packaging.as_sold.100ml.nutrients.saturated.fat.value","nutrition.input_sets.packaging.as_sold.100ml.nutrients.sugars.value","nutrition.input_sets.packaging.as_sold.100ml.nutrients.proteins.value","product_name_es","categories","categories_tags")
almendra_oficial <- almendra[,col_oficial]
col_oficial %in% names(almendra)
almendra_oficial <- almendra[,col_oficial] %>%
dplyr::rename ( kcal = nutrition.input_sets.packaging.as_sold.100ml.nutrients.energy.kcal.value, grasa = nutrition.input_sets.packaging.as_sold.100ml.nutrients.fat.value, grasa_saturadas = nutrition.input_sets.packaging.as_sold.100ml.nutrients.saturated.fat.value, azucar = nutrition.input_sets.packaging.as_sold.100ml.nutrients.sugars.value, proteinas = nutrition.input_sets.packaging.as_sold.100ml.nutrients.proteins.value,nombre_español = product_name_es, categoria = categories, categoria_tag = categories_tags)
almendra_numeros <- almendra_oficial %>%
  filter(!is.na(kcal) & !is.na(grasa) & !is.na(grasa_saturadas) & !is.na(azucar) & !is.na(proteinas))
almendra_bebidas <- almendra_numeros %>%
  filter(grepl("beverage|drink|milk|bebida|leche", categoria_tag, ignore.case = TRUE))
View(almendra_bebidas)