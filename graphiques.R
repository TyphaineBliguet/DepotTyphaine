######ggplot2###

#install.packages("ggplot2")
library(ggplot2)

######################### import DONNES #######################################

#install.packages("palmerpenguins")
library("palmerpenguins")
head(penguins)
library(ggplot2)

################### NUAGE DE POINTS ################################## 

ggplot(penguins) +
  geom_point(aes(x = bill_length_mm, y = bill_depth_mm,color = species, size = body_mass_g)) +
  labs(title = "RELATION LONGUEUR VS PROFONDEUR du bec DES MANCHOTS !!!",
       x = "LONGUEUR BEC (MM)",
       y = "PROFONDEUR BEC (MM)") +
  scale_color_manual(values = c("cyan", "magenta", "yellow")) +
  theme_dark() +
  theme(plot.title = element_text(size = 17, face = "bold", color = "purple"),
        axis.text = element_text(size = 12, angle = 60, color = "red"),
        legend.text = element_text(size = 10, face = "bold", color = "hotpink"),
        legend.position = "top")

################### BOXPLOT ################################## 

ggplot(penguins, aes(x = species, y = flipper_length_mm, fill = species)) +
  geom_boxplot() +
  geom_jitter(aes(x = species, y = flipper_length_mm), col = "black", alpha = 0.5)+
  labs(title = "Longueur des nageoires par espèces",
       x = "Espèce",
       y = "Longueur des nageoires (mm)") +
  theme_linedraw()+
  theme(plot.title = element_text(size = 15, face = "bold", color = "hotpink"), 
        axis.text.x = element_text(size = 10, angle = 60, color = "red"))


################# Histogramme ########################
ggplot(penguins, aes(x = body_mass_g, fill = species)) +
  geom_histogram(binwidth = 200, alpha = 1, position = "identity", color = "black") +
  facet_wrap(vars(species)) +
  labs(title = "REPARTITION DE LA MASSE CORPORELLE DES MANCHOTS!!!",
       x = "CORPS MASSE (g)",
       y = "NBR INDIVIDU") +
  scale_fill_manual(values = c("red", "green", "blue")) +
  theme_dark() +
  theme(plot.title = element_text(size = 20, face = "bold", color = "purple"),
        axis.text.x = element_text(angle = 90, hjust = 1, color = "orange"),
        axis.text.y = element_text(color = "brown"),
        strip.text = element_text(face = "bold", color = "yellow"),
        legend.position = "top")








