ggplot(tabla2, aes(x = tipo, y = scoring_media, fill = tipo)) +
  geom_col(width = 0.7, alpha = 0.9) +
  scale_fill_brewer(palette = "Pastel2") +
  labs(
    title = "Media del Scoring nutricional \npor tipo de bebida",
    fill = "Tipo de bebida",
    y = "Scoring medio"
  ) +
  theme_minimal(base_size = 12) +
  theme(
    plot.title = element_text(face = "bold", size = 15, hjust = 0.5),
    plot.title.position = "panel",
    axis.title.x = element_blank(),
    axis.text.x = element_blank(),
    axis.ticks.x = element_blank(),
    legend.position = "right",
    panel.grid.minor = element_blank(),
    panel.grid.major.x = element_blank()
  )

ggsave("grafico_medias.png",width = 6, height = 5, dpi = 300)
