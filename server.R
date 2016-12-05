#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(MASS)

shinyServer(function(input, output) {
        Animals$logBody <- log(Animals$body)
        Animals$logBrain <- log(Animals$brain)
        model <- lm(logBrain ~ logBody, data = Animals)
        
        pred <- reactive({
                bodyInput <- input$sliderBody
                predict(model, newdata = data.frame(logBody = bodyInput))
        })
        
        output$plot <- renderPlot({
                bodyInput <- input$sliderBody
                
                plot(Animals$logBody, Animals$logBrain, 
                     xlab = "Body Size (log of kg)", ylab = "Brain Size (log of g)", 
                     bty = "n", pch = 16,
                     xlim = c(0, 12), ylim = c(0, 9))
                if(input$showModel){
                        abline(model, col = "blue", lwd = 2)
                }
                legend(25, 250, c("Model Prediction"), pch = 16,
                       col = c("blue"), bty = "n", cex = 1.2)
                points(bodyInput, pred(), col = "blue", pch = 16, cex = 2)
        })
        
        output$pred <- renderText({
                pred()
        })

})

