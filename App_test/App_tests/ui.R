library(shiny)

fluidPage(
  
  # Application title
  titlePanel("APPLICATION TEST"),
  
  sidebarLayout(
    sidebarPanel(
      sliderInput("bins",
                  "Nombre de classe :",
                  min = 1,
                  max = 50,
                  value = 30),
      selectInput("Couleur",
                  "Choisir la couleur",
                  choices = c("lightpink", "lightblue", "lightgreen")),
            radioButtons("choix", "Vous avez ? :",
                   choices = c("Entre 1 et 18 ans" = "Entre 1 et 18 ans", 
                               "Entre 18 et 30 ans" = "Entre 18 et 30 ans", 
                               "Plus de 30 ans" = "Plus de 30 ans"),
                   selected = "Entre 1 et 18 ans"),
      dateInput(inputId = "idDate", 
                label = "Entrez votre date de naissance", 
                format = "dd/mm/yyyy", startview = "month", weekstart = 0, language = "fr"),
      
      # Champ de texte pour le titre
      textInput("titre", 
                "Entrez le titre du graphique :", "Mon Graphique")
    ),
    
    # Main panel avec les graphiques et résultats
    mainPanel(
      plotOutput("graphique"),
      textOutput("info_message"),
      textOutput("resultat"),
      plotOutput("distPlot"),
      textOutput("date_du_jour"),
      textOutput("texte")
    )
  )
)
