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
		showOutput("resultPlot", "polycharts")
		)
	)
)
