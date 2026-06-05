variables_std <- todas |>
  mutate(
    kcal_z = scale(kcal),
    grasa_z = scale(grasa),
    grasas_saturadas_z = scale(grasa_saturadas),
    azucar_z = scale(azucar),
    proteinas_z =scale(proteinas)
    )

variables_std <- variables_std |>
  mutate(scoring = -kcal_z + -grasa_z + -grasas_saturadas_z + -azucar_z + proteinas_z
         )

library(ggplot2)

ggplot(variables_std, aes(x = tipo, y = scoring, fill = tipo)) +
  geom_boxplot(
    width = 0.55,
    alpha = 0.75,
    color = "grey25",
    outlier.color = "grey35",
    outlier.size = 1.6,
    linewidth = 0.35
  ) +
  scale_fill_brewer(palette = "Pastel2") + 
  scale_y_continuous(expand = expansion(mult = c(0.05, 0.1))) + 
  labs(
    title= "Scoring nutricional estandarizado",
       fill= "Tipo de bebida",
       y = "Scoring(estandarizado)"
       ) +
  theme_minimal(base_size = 12) +
  theme(
    plot.title = element_text(face = "bold", size = 15, hjust= 0.5),
    plot.title.position = "panel",
    axis.title.x = element_blank(),
    axis.text.x = element_blank(),
    axis.ticks.x = element_blank(),
    axis.title.y = element_text(size=12),
    axis.text.y = element_text(size = 10),
    legend.position = "right",
    legend.text = element_text(size = 12),
    legend.title = element_text(size = 13,face = "bold"),
    panel.grid.minor = element_blank(),
    panel.grid.major.x = element_blank()
  )
ggsave("boxplot_scoring.png",width = 6, height = 5, dpi = 300)
