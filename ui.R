#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(MASS)

shinyUI(fluidPage(
        titlePanel("Predict brain size (g) by body size (kg) of an animal"),
        sidebarLayout(
                sidebarPanel(
                        sliderInput("sliderBody", "What is the body size of the animal?", 
                                    0, 12, value = 6),
                        checkboxInput("showModel", "Show/Hide Model", value = TRUE),
                        submitButton("Submit")
                ),
                mainPanel(
                        plotOutput("plot"),
                        h3("Predicted brain size from model:"),
                        textOutput("pred")
                )
        )
))
