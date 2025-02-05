############################################################################
############################################################################
###################  ANALYSES - INDICATEURS  ###############################
############################################################################
############################################################################

## Date : 15/11/2024 
## Auteur :Typhaine BLIGUET

##########################################################################
########################### Fonction utiles ##############################
##########################################################################

#%>% 
#read_excel()
#select() avec start_with() par exemple
#filter()
#mutate()
#fct_recode()
#group_by_()
#summarise()
#left_join() right_join() inner_join() full_join()
#pivot_longer() pivot_wider()
# ...

##########################################################################
########################### Import #######################################
##########################################################################
install.packages("readxl")
library("readxl")
library(tidyverse)

Sites <- read_excel("data/Sites.xlsx")
Microorga <- read_excel("data/Microorganismes.xlsx")
Nematodes <- read_excel("data/Nematodes.xlsx")
Vers <- read_excel("data/Lombrics.xlsx")

##########################################################################
######################### Jointure de tables #############################
##########################################################################
########### CONSIGNE : Choisir deux communauté biologique ###########
##associé table des sites et 2 communautés 

### inner_join(sites, microorga, join_by(id))

Sites %>% inner_join(Microorga, join_by(ID)) %>% inner_join(Nematodes, join_by(ID))-> SitesMN
SitesMN

view(SitesMN)

##########################################################################
################## Sélection de lignes et colonnes ##################
##########################################################################
########### CONSIGNE : Choisir un site ###########

SitesMN %>% filter(SITE == "Feucherolles") -> SiteF ###selection d'un site
view (SiteF)

SiteF %>% select(SITE:MODE_DE_CONDUITE) -> test ####test selection colonnes 
view(test)

##########################################################################
####################### Créer des variables ##################
##########################################################################

SiteF %>%  mutate(Diff_argile_limon =ARGILE - LIMON_F,
                  Ratio_Argile_limon = ARGILE/LIMON_F) -> result 
view(result)

####calcul de 2 nouvelles variables

##########################################################################
############################## Calculs par groupe ########################
##########################################################################
########### CONSIGNE : calculs sur plusieurs variables en même temps######

SiteF %>% 
  group_by(MODE_DE_CONDUITE) %>% 
  summarise(mean_argile=mean(ARGILE),
            mean_limon=mean(LIMON_F)) 

#moyenne de l'argile et du limon regroupé par le mode de conduite 

##########################################################################
####################### Graphique ########################
##########################################################################
########### CONSIGNE : un graphique en modifiant l'ordre et en recodant des modalités
library(ggplot2)

SiteF %>% 
  mutate(Modalite = Modalite %>% 
           fct_recode(FEOMR = "FeOMR", FETE = "FeTe", FEFUM="FeFum", 
                      FEDVB="FeDVB", FEBIO="FeBio") %>% 
           fct_rev()) %>% 
  ggplot(aes(x = Modalite, y = ARGILE)) + 
  geom_boxplot() +
  labs(title = "Boxplot de l'argile par modalité") +
  theme_minimal()

##########################################################################
######################## Pivots ##########################################
##########################################################################
pivot_longer(SiteF, cols = c(ARGILE, LIMON_F), names_to = "variable", values_to = "value")
pivot_wider(SiteF, names_from = "MODE_DE_CONDUITE", values_from = c(ARGILE, LIMON_F))

##########################################################################
####################### Enchaîner tous les traitements ###################
##########################################################################

Sites %>% 
  inner_join(Microorga, by = "ID") %>% 
  inner_join(Nematodes, by = "ID") %>% 
  filter(SITE == "Feucherolles") %>% 
  mutate(Diff_argile_limon = ARGILE - LIMON_F,
         Ratio_Argile_limon = ARGILE / LIMON_F) %>% 
  group_by(MODE_DE_CONDUITE) %>% 
  summarise(mean_argile = mean(ARGILE),
            mean_limon = mean(LIMON_F)) %>% 
  ggplot(aes(x = MODE_DE_CONDUITE, y = mean_limon)) + 
  geom_bar(stat = "identity") +
  labs(title = "Moyenne de limon par mode de conduite")
