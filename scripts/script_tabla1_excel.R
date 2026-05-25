tabla1 <- descriptivos |>
  mutate(
    `Energía (kcal/100 mL)` = sprintf("%.1f ± %.1f", kcal_media, kcal_sd),
    `Grasa total (g/100 mL)` = sprintf("%.2f ± %.2f", grasa_total_media, grasa_total_sd),
    `Grasa saturada (g/100 mL)` = sprintf("%.2f ± %.2f", grasa_saturada_media, grasa_saturada_sd),
    `Azúcares (g/100 mL)` = sprintf("%.2f ± %.2f", azucar_media, azucar_sd),
    `Proteínas (g/100 mL)` = sprintf("%.2f ± %.2f", proteina_media, proteina_sd)
  ) |>
  select(
    `Tipo de bebida` = tipo,
    `n (productos)` = n,
    `Energía (kcal/100 mL)`,
    `Grasa total (g/100 mL)`,
    `Grasa saturada (g/100 mL)`,
    `Azúcares (g/100 mL)`,
    `Proteínas (g/100 mL)`
  )

write_xlsx(tabla1, "Tabla1_Descriptivos_Excel.xlsx")
