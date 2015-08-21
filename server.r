# First get all of the initial stuff done

library( "shiny")
library( "ggplot2")
library( "dplyr")
library( "reshape2")


# add measures per person, only has to be done once
df <- tips 
df$billPP <- df$total_bill/df$size
df$tipPP <- df$tip/df$size
df$size <- as.factor( df$size)  # change size to factor for plotting purposes


# define function to create scatter plot with linear regression line through each group
createPlot <- function( data, grouping){
  
  if (grouping=="sex (M/F)"){
      ggplot( data, aes( x=billPP, y=tipPP, color=sex, shape=sex)) + 
        geom_point() + 
        geom_smooth( method=lm, se=F) +
        ylab( "tip per person ($)") +
        xlab( "bill per person ($)")
  } else if (grouping=="smoker (Y/N)"){
      ggplot( data, aes( x=billPP, y=tipPP, color=smoker, shape=smoker)) + 
        geom_point() + 
        geom_smooth( method=lm, se=F) +
        ylab( "tip per person ($)") +
        xlab( "bill per person ($)")
  } else if (grouping=="day (Thur..Sun)"){
      ggplot( data, aes( x=billPP, y=tipPP, color=day, shape=day)) + 
        geom_point() + 
        geom_smooth( method=lm, se=F) +
        ylab( "tip per person ($)") +
        xlab( "bill per person ($)")
  } else if (grouping=="mealtype (Dinner/Lunch)"){
      ggplot( data, aes( x=billPP, y=tipPP, color=time, shape=time)) + 
        geom_point() + 
        geom_smooth( method=lm, se=F) +
        ylab( "tip per person ($)") +
        xlab( "bill per person ($)")
  } else {
      ggplot( data, aes( x=billPP, y=tipPP, color=size, shape=size)) + 
        geom_point() + 
        geom_smooth( method=lm, se=F) +
        ylab( "tip per person ($)") +
        xlab( "bill per person ($)")
  }
  

}  # createPlot  




################ this is where the fun begins ;-) ##################

shinyServer(function(input, output) {  

  
  groupBy <- reactive({  # needs to change every time the ui control changes
    input$group
  })  # groupBy 
  
  
  output$plot <- renderPlot( createPlot( df, groupBy()))
  
})  # shinyServer