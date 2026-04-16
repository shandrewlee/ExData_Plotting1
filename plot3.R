plot3 <- function(tbl = NULL){

    source("get_tbl.R")
    if (is.null(tbl)){
        tbl <- get_tbl()
        par(mfrow = c(1, 1))
    }
    
    plot(tbl$datetime, tbl$Sub_metering_1,
        xaxt = "n",
        type = "l",
        ylab = "Energy sub metering",
        xlab = "",
        col = "black"
    )
    lines(tbl$datetime, tbl$Sub_metering_2, col = "red")
    lines(tbl$datetime, tbl$Sub_metering_3, col = "blue")
    legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
           col = c("black","red","blue"), lty = 1, cex = 0.8)
    axis(1,
         at = seq(min(tbl$datetime), max(tbl$datetime), length.out = length(unique(tbl$Weekday)) + 1),
         labels = c(unique(tbl$Weekday), weekdays(as.Date(max(tbl$Date), format = "%d/%m/%Y") + 1, abbreviate = TRUE))
    )
    
    dev.copy(png, "plot3.png")
    dev.off()
    
}