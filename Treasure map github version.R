# Treasure map
# This is a modified version of a treasure map I made for Taipei
# The original map actually leads to buried treasure!
# This map doesn't lead anywhere. It just shows how the map was made. 

library(leaflet)
library(shiny)
library(dplyr)

ui <- fluidPage(
  fluidRow(column(4,textInput("password","The first password?")),
           column(4,textInput("password2","The second password?"))),
  fluidRow(leafletOutput("TreasureMap"))
)

# code for treasure map x: https://rud.is/b/2015/09/19/a-package-full-o-pirates-makin-interactive-pirate-maps-in-arrrrrrstats/

server<- function(input,output,session){
  x_marker <- icons("http://rud.is/dl/x.png",
                    iconHeight=16, iconWidth=16,
                    iconAnchorX=8, iconAnchorY=8)
  
  output$TreasureMap <- renderLeaflet(leaflet()%>%
                                      addProviderTiles(providers$Stamen.Watercolor)%>%
                                      addMarkers(icon=x_marker,lat=25.034573001368337, 
                                                 lng=121.51925971356991,
                                                 popup  = "Under the bridge")%>%
                                      addMarkers(icon=x_marker,lat=ifelse(input$password=="password1",
                                                                          26,
                                                                          29),
                                                 lng=ifelse(input$password=="password1",
                                                            120,
                                                            129),
                                                 popup = ifelse(input$password=="password1",
                                                                "clue1",
                                                                "Sorry, you haven't found the right password yet"))%>%
                                      addMarkers(icon=x_marker,lat=ifelse(input$password2=="password2",
                                                                          25, 
                                                                          21),
                                                 lng=ifelse(input$password2=="password2",
                                                            118,
                                                            110),
                                                 popup  = ifelse(input$password2=="password2",
                                                                 "clue2",
                                                                 "Sorry, you haven't found the right password yet"))
                                    
  )
}

#server<- function(input,output,session){}

shinyApp(ui,server)
