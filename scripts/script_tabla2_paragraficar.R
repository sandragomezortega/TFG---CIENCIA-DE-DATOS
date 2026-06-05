tabla4 <- variables_std |>
  group_by(tipo) |>
  summarise(
    `n (productos)` = n(),
    scoring_media = mean(scoring),
    scoring_sd = sd(scoring)
  )

library(writexl)
write_xlsx(tabla4, "Tabla4_Scoring_NoExcel.xlsx")
