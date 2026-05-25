tabla2_excel <- tabla2 |>
  mutate(
    `Scoring (media ± SD)` = sprintf("%.2f ± %.2f", scoring_media, scoring_sd)
  ) |>
  select(
    `Tipo de bebida` = tipo,
    `n (productos)`,
    `Scoring (media ± SD)`
  )
write_xlsx(tabla2_excel, "Tabla2_Scoring_Excel.xlsx")


