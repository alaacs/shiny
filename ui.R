library(shiny)
require(rCharts)
options(RCHART_LIB = 'polycharts')
shinyUI(pageWithSidebar(
	headerPanel("Brain to Body ratios: Mammals dataset"),
	sidebarPanel(
    selectInput("StatType", "Please select between top or bottom ratios:", choices=c("Top", "Bottom")),
    sliderInput(inputId = "sliderRatioCnt", label = "Number of ratios", min = 1, max = 50, value = 10)
		),
	mainPanel(
		showOutput("resultPlot", "polycharts"),
    a("Click here for documentation", 
      href="https://docs.google.com/document/d/1hIXPwUtXPVuhPIiJe1Yc1k-yguuc6swUE-4EihVuOY4/pub#ftnt1",
      target="_blank")
		)
	)
)
