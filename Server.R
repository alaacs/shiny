library(shiny)
library(rCharts)
options(RCHART_WIDTH = 800)
#read mammals dataset from csv file(modified version of mammals dataset from MASS)
mammals2 <- read.csv("mammals.csv")
shinyServer(
	function(input, output){
    output$resultPlot <- renderChart2({
      #Sort mammals dataset based on brain to body ratio
      if(input$StatType == "Bottom")
        positions <- order(mammals2$brain/mammals2$body, decreasing = F)
      else 
        positions <- order(mammals2$brain/mammals2$body, decreasing = T)
      mammalsOrdered <- mammals2[positions,]
      #take top 10
      mammalsOrdered <- mammalsOrdered[1:input$sliderRatioCnt,]
      #Calculate brain to body ratio 
      #brain is in Grams, Body is in Kilograms
      #brain to body ration(percentage) = (brain(gm)/1000)/body(kgs) * 100 = brain/body/10
      brainToBody <- mammalsOrdered$brain/mammalsOrdered$body/10
      #add the brain to body ration vector to the dataset
      mammalsOrdered <- cbind(mammalsOrdered, brainToBody)
      #add name column to include in the chart
      name <- rownames(mammalsOrdered)
      mammalsOrdered <- cbind(name, mammalsOrdered)
      return (rPlot(x = list(var = "name", sort = "brainToBody"), y = "brainToBody", 
                  data = mammalsOrdered, type = 'bar', color= "averageYears"))
	})
})
