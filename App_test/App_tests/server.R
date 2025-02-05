
library(shiny)

# Define server logic required to draw a histogram
function(input, output, session) {

    output$distPlot <- renderPlot({

        # generate bins based on input$bins from ui.R
        x    <- faithful[, 2]
        bins <- seq(min(x), max(x), length.out = input$bins + 1)

        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = input$Couleur, border = 'white',
             xlab = 'Waiting time to next eruption (in mins)',
             main = input$titre)
    })
    output$info_message <- renderText({
      if (input$bins < 10) {
        "Le nombre de classes est faible, l'histogramme sera moins précis."
      } else if (input$bins > 40) {
        "Le nombre de classes est élevé, l'histogramme risque d’être surchargé."
      } else {
        "Réglage optimal du nombre de classes !"
      }
    })
    output$resultat <- renderText({
      paste("Pour rappel, vous avez choisi :", input$choix)
    })
    output$date_du_jour <- renderText({
      paste("Nous sommes le", Sys.Date())
    })
    output$texte <- renderText({
      c("TYPHAINE BLIGUET")
    })

}
