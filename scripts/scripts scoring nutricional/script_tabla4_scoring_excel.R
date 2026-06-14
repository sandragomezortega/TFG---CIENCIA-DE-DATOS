tabla4_excel <- tabla4 |>
  mutate(
    `Scoring (media ± SD)` = sprintf("%.2f ± %.2f", scoring_media, scoring_sd)
  ) |>
  select(
    `Tipo de bebida` = tipo,
    `n (productos)`,
    `Scoring (media ± SD)`
  )
write_xlsx(tabla4_excel, "Tabla4_Scoring_Excel.xlsx")


