plot4 <- function(){
    
    source("plot2.R")
    source("get_tbl.R")
    source("plot3.R")
    
    tbl <- get_tbl()
    
    par(mfcol = c(2,2))
    plot2(tbl)
    plot3(tbl)
    plot(tbl$datetime, as.numeric(tbl$Voltage, na.rm = TRUE),
         type = "l",
         xaxt = "n",
         ylab = "Global Active Power (kilowatts)",
         xlab = "datetime")
    axis(1,
         at = seq(min(tbl$datetime), max(tbl$datetime), length.out = length(unique(tbl$Weekday)) + 1),
         labels = c(unique(tbl$Weekday), weekdays(as.Date(max(tbl$Date), format = "%d/%m/%Y") + 1, abbreviate = TRUE))
    )
    
    plot(tbl$datetime, as.numeric(tbl$Global_reactive_power, na.rm = TRUE),
         type = "l",
         xaxt = "n",
         ylab = "Global Active Power (kilowatts)",
         xlab = "datetime")
    axis(1,
         at = seq(min(tbl$datetime), max(tbl$datetime), length.out = length(unique(tbl$Weekday)) + 1),
         labels = c(unique(tbl$Weekday), weekdays(as.Date(max(tbl$Date), format = "%d/%m/%Y") + 1, abbreviate = TRUE))
    )
    
    dev.copy(png,"plot4.png")
    dev.off()
    
}