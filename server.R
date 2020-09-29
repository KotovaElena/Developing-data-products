function(input, output, session) {
    
    # Combine the selected variables into a new data frame
    selectedData <- reactive({
        iris[, c(input$xcol, input$ycol)]
    })
    
    clusters <- reactive({
        kmeans(selectedData(), input$clusters)
    })
    
    output$plot1 <- renderPlot({
        palette(c("#7109AA", "#FFFF00", "#CD0074", "#9FEE00",
                  "#00AC6B", "#0C5DA5", "#FF9500","#FF4F00"))
        
        par(mar = c(5.1, 4.1, 0, 1))
        plot(selectedData(),
             col = clusters()$cluster,
             pch = 20, cex = 3)
        points(clusters()$centers, pch = 8, cex = 3.5, lwd = 2)
    })
    
}