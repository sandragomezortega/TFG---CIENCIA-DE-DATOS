library(rstatix)
library(writexl)

variables_std <- variables_std |>
  mutate(
    scoring = as.numeric(scoring),
    tipo = as.factor(tipo)
  )
normalidad_scoring <- variables_std |>
  group_by(tipo) |>
  shapiro_test(scoring)

levene_scoring <- variables_std |>
  levene_test(scoring ~ tipo)

anova_scoring <- variables_std |>
  anova_test(scoring ~ tipo)

kruskal_scoring <- variables_std |>
  kruskal_test(scoring ~ tipo)

eta_scoring <- variables_std |>
  kruskal_effsize(scoring ~ tipo)

dunn_scoring <- variables_std |>
  dunn_test(scoring ~ tipo,
            p.adjust.method = "BH")

write_xlsx(
  list(
    normalidad = normalidad_scoring,
    levene = levene_scoring,
    anova = anova_scoring,
    kruskal = kruskal_scoring,
    eta = eta_scoring,
    dunn = dunn_scoring
  ),
  "Analisis_Est_Scoring.xlsx"
)