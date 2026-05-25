ggplot(todas, aes(x = tipo, y = grasa, fill = tipo)) +
  geom_boxplot(
    width = 0.55,
    alpha = 0.75,
    color = "grey25",
    outlier.color = "grey35",
    outlier.size = 1.6,
    linewidth = 0.35
  ) +
  scale_fill_brewer(palette = "Pastel2") +
  scale_y_continuous(expand = expansion(mult = c(0.05,0.1))) +
  labs(
    title = "Comparación de grasa por tipo de bebida",
    fill = "Tipo de bebida",
    y = "Grasa total (g) por 100 mL"
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
    panel.grid.minor = element_blank(),
    panel.grid.major.x = element_blank()
  )
ggsave("boxplot_grasa_total.png",width = 6, height = 5, dpi = 300)
