library(ggplot2)
library(patchwork)

tema_boxplot <- theme_minimal() +
  theme(
    plot.title = element_text(size = 14, face = "bold", hjust = 0.5),
    axis.title.x = element_blank(),
    axis.text.x = element_blank(),
    axis.ticks.x = element_blank(),
    legend.position = "bottom"
  )

p_kcal <- ggplot(todas, aes(x = tipo, y = kcal, fill = tipo)) +
  geom_boxplot(alpha = 0.7) +
  scale_fill_brewer(palette = "Pastel2") +
  labs(title = "Energía", y = "kcal/100 mL", fill = "Tipo de bebida") +
  tema_boxplot

p_grasa <- ggplot(todas, aes(x = tipo, y = grasa, fill = tipo)) +
  geom_boxplot(alpha = 0.7) +
  scale_fill_brewer(palette = "Pastel2") +
  labs(title = "Grasas totales", y = "g/100 mL", fill = "Tipo de bebida") +
  tema_boxplot

p_saturadas <- ggplot(todas, aes(x = tipo, y = grasa_saturadas, fill = tipo)) +
  geom_boxplot(alpha = 0.7) +
  scale_fill_brewer(palette = "Pastel2") +
  labs(title = "Grasas saturadas", y = "g/100 mL", fill = "Tipo de bebida") +
  tema_boxplot

p_azucar <- ggplot(todas, aes(x = tipo, y = azucar, fill = tipo)) +
  geom_boxplot(alpha = 0.7) +
  scale_fill_brewer(palette = "Pastel2") +
  labs(title = "Azúcares", y = "g/100 mL", fill = "Tipo de bebida") +
  tema_boxplot

p_proteinas <- ggplot(todas, aes(x = tipo, y = proteinas, fill = tipo)) +
  geom_boxplot(alpha = 0.7) +
  scale_fill_brewer(palette = "Pastel2") +
  labs(title = "Proteínas", y = "g/100 mL", fill = "Tipo de bebida") +
  tema_boxplot

figura_boxplots <- (p_kcal + p_grasa + p_saturadas) /
   (p_azucar + p_proteinas + plot_spacer()) +
  plot_layout(guides = "collect") &
  theme(legend.position = "bottom",
        legend.text = element_text(size = 14),
        legend.title = element_text(size = 15,face = "bold")
        )

ggsave("boxplot_variables_nutricionales.png",
       figura_boxplots,
       width = 14,
       height = 9,
       dpi = 300)