tabla5_scoring <- kruskal_scoring |>
  left_join(eta_scoring, by = ".y.") |>
  mutate(
    Variable = "Scoring nutricional",
    H = round(statistic, 2),
    `p-valor` = ifelse(p < 0.001, "<0.001", sprintf("%.3f", p)),
    `η²` = round(effsize, 3)
  ) |>
  select(Variable, H, `p-valor`, `η²`)

tabla5_scoring

write_xlsx(
  list(
    Tabla5_Kruskal_Scoring = tabla5_scoring
  ),
  "Tabla5_Kruskal_Scoring.xlsx"
)