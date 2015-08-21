shinyUI( 
  
  
  fluidPage(
    
    titlePanel( "Tipping Behavior"),
    
    sidebarLayout(
      sidebarPanel(
        p( "This dashboard shows tipping behavior in the US."),
        br(),
        p( "The plot shows tip amount per person as a function of the bill amount per person. It also shows a linear regression line for each of the groups that you want to compare."),
        br(),
        p( "The selector below allows you to compare tipping behavior between different groups, for instance men vs women, days of the week, dinner vs lunch, etc."),
        br(),
        p( "Just pick one of the groups to compare from the picklist below and the plot will respond immediately. Different groups will have different color and shape."),
        br(),
        selectInput( "group", 
                     "group to compare:", 
                     c("sex (M/F)", "smoker (Y/N)", "day (Thur..Sun)", "mealtype (Dinner/Lunch)", "size of party (1..6)"), 
                     multiple=F
        )  # selectInput

      ),
      mainPanel(
        plotOutput( "plot")
      )
    )
  )
)  
