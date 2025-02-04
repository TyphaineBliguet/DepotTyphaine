######################### import DONNEES #######################################
#install.packages("ggplot2")
#install.packages("palmerpenguins")
library("palmerpenguins")
library(ggplot2)
######################### CONTEXTE #######################################
##BLiGUET Typhaine
##Jeux de données ==> Penguins

################### 1 er GRAPH : NUAGE DE POINTS ################################## 
## évolution profondeur de bec en fonction longeur de bec
## couleur différente pour l'espèce et taille de cercle différente pour la masse des manchots

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


################# 2 ème GRAPH Histogramme ########################
##comparaison entre même espèce de la masse des manchots
## un graph par espèce 

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








