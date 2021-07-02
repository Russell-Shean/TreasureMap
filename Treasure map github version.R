# Treasure map

# This is the code for: 
# If I gave you a version of the map and you're looking at the source code,...
# Sorrrrryy, I changed the password and the coordinates for the git hub version
# Guess the only way to find the treasure is by following the clues! 
# If you're curious about how I made the map, here's the code:


library(leaflet)
library(shiny)
library(dplyr)

ui <- fluidPage(
  fluidRow(column(4,textInput("password","Thar fiRRRst passwarrrd?")),
           column(4,textInput("password2","Thar 2nd passwarrrd?"))),
  fluidRow(leafletOutput("trsrrrmap"))
)

# code for treasure map x: https://rud.is/b/2015/09/19/a-package-full-o-pirates-makin-interactive-pirate-maps-in-arrrrrrstats/

server<- function(input,output,session){
  x_marker <- icons("http://rud.is/dl/x.png",
                    iconHeight=16, iconWidth=16,
                    iconAnchorX=8, iconAnchorY=8)
  
  output$trsrrrmap <- renderLeaflet(leaflet()%>%
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
                                                                "sorry wrong passwarrrrd no TreasuRRRR for you"))%>%
                                      addMarkers(icon=x_marker,lat=ifelse(input$password2=="password2",
                                                                          25, 
                                                                          21),
                                                 lng=ifelse(input$password2=="password2",
                                                            118,
                                                            110),
                                                 popup  = ifelse(input$password2=="password2",
                                                                 "clue2",
                                                                 "Tharrr 2nd passwarrrrds wrong!"))
                                    
  )
}

#server<- function(input,output,session){}

shinyApp(ui,server)
