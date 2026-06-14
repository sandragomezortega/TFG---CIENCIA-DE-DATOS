tabla_kruskal <- kruskal_resultados |>
  left_join(eta_kruskal, by = "nutriente") |>
  mutate(
    nutriente = case_when(
      nutriente == "kcal" ~ "Energía",
      nutriente == "grasa" ~ "Grasas totales",
      nutriente == "grasa_saturadas" ~ "Grasas saturadas",
      nutriente == "azucar" ~ "Azúcares",
      nutriente == "proteinas" ~ "Proteínas",
      TRUE ~ nutriente
    ),
    H = round(statistic, 2),
    `p-valor` = ifelse(p < 0.001, "<0.001", sprintf("%.3f", p)),
    `η²` = round(effsize, 3)
  ) |>
  arrange(match(nutriente,
                c("Energía",
                  "Grasas totales",
                  "Grasas saturadas",
                  "Azúcares",
                  "Proteínas"))) |>
  select(Nutriente = nutriente, H, `p-valor`, `η²`)

tabla_dunn <- dunn_resultados |>
  filter(p.adj < 0.05) |>
  mutate(
    nutriente = case_when(
      nutriente == "grasa_saturadas" ~ "Grasas saturadas",
      nutriente == "proteinas" ~ "Proteínas",
      TRUE ~ nutriente
    ),
    Comparación = paste(group1, "vs", group2),
    `p ajustado` = ifelse(p.adj < 0.001, "<0.001", sprintf("%.3f", p.adj))
  ) |>
  select(Nutriente = nutriente, Comparación, `p ajustado`)

write_xlsx(
  list(
    Tabla2_Kruskal = tabla_kruskal,
    Tabla3_Posthoc = tabla_dunn
  ),
  "Tablas_Estadisticas_Kruskall.xlsx"
)