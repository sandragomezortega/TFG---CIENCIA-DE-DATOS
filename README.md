#**Comparación nutricional entre la leche de vaca y bebidas vegetales: Un análisis basado en datos disponibles en Open Food Facts**

##**Descripción del proyecto**

En este repositorio se encuentran los datos, scripts, resultados y documentación desarrollados para el trabajo de Fin de Grado (TFG) del Grado en Ciencia y Tecnología de los Alimentos por la Universidad de Barcelona.

El estudio compara y analiza el perfil nutricional de la leche de vaca frente a tres bebidas vegetales (soja,avena y almendra) mediante diversas técnicas de análisis de datos aplicadas a información nutricional obtenidas de la base de datos abierta Open Food Facts.

##**Objetivos del estudio**

Los objetivos del estudio fueron:

- Comparar la composición nutricional de la leche de vaca frente a las bebidas vegetales de soja, avena y almendra mediante datos abiertos.
- Evaluar diferencias en energía, grasas totales, grasas saturadas, azúcares y proteínas.
- Analizar la variabilidad nutricional existente dentro de cada categoría de producto.
- Desarrollar un scoring nutricional capaz de integrar diferentes variables nutricionales en una única medida.
- Explorar la utilidad de las bases de datos abiertas para la investigación nutricional y el análisis de productos alimentarios.

##**Metodología del estudio**

La metodología empleada en el estudio fue:

1. Descarga de datos sobre información nutricional a partir de Open Food Facts
2. Limpieza, filtrado y depuración de los datos
3. Selección de variables nutricionales por 100mL de producto: Energía, grasas totales, grasas saturadas, azúcares y proteínas
4. Análisis estadístico descriptivo e inferencial
5. Desarrollo de un *scoring* nutricional basado en la estandarización con *z-scores*
6. Generación de tablas y figuras para la interpretación de los resultados

##**Estructura del repositorio**

**1. TFG** *Incluye el marco teórico, la metodología, los resultados, la discusión y las conclusiones del estudio*

**2. datos** *Incluye los datos brutos descargados de Open Food Facts para la leche de vaca y las bebidas de soja,avena y almendra y los datos depurados tras el proceso de limpieza de datos*

**3. resultados** *Incluye los boxplots creados para las variables nutricionales y el scoring nutricional, los análisis estadísticos y las tablas correspondientes*

**4. scripts** *Incluye todos los scripts que han sido necesarios para el desarrollo del estudio*

**5. prompts_IA** *Incluye los prompts utilizados con inteligencia artificial para mejoras de código y redacción*

**6. informe_A** *Incluye el informe final del estudio en formato de artículo científico junto a la portada utilizada para la entrega del TFG*

**7. informe_B** *Incluye el informe donde se recoge información general del TFG (Título, autor, ODS, justificación de la revista científica seleccionada, entre otros)*
**8. ARTICULO_FINAL** *Incluye la versión completa del artículo con la portada integrada en un único documento, siendo esta la versión final presentada como Trabajo de Final de Grado*

##**Herramientas utilizadas**

Los análisis se realizaron principalmente con:

- *R* y la interfaz *R Studio*
- *tidyverse*
- *ggplot2*
- *readr*
- *stats*

El uso de paquetes auxiliares fue necesario para análisis estadísticos, creación de figuras y exportación  de resultados

##**Base de datos**

Los datos obtenidos para este estudio provienen de la base de datos abierta Open Food Facts, una base de datos colaborativa donde se recopila información nutricional y características de productos alimentarios existentes en el mercado.

##**Autor**

Sandra Gómez Ortega
