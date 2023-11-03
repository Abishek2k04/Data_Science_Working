library(shinydashboard)
library(shiny)
ui <- dashboardPage(
  dashboardHeader(title = "Basic Dashboard"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
      menuItem("widgets", tabName = "widgets", icon = icon("th"))
    )
  )
)