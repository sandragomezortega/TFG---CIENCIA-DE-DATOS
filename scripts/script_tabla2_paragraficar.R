tabla2 <- todas_std |>
  group_by(tipo) |>
  summarise(
    `n (productos)` = n(),
    scoring_media = mean(scoring),
    scoring_sd = sd(scoring)
  )

library(writexl)
write_xlsx(tabla2, "Tabla2_Scoring_NoExcel.xlsx")
