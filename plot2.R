plot2 <- function(tbl = NULL){

    source("get_tbl.R")
    if (is.null(tbl)){
        tbl <- get_tbl()
        par(mfrow = c(1,1))
    }
    
    plot(tbl$datetime, as.numeric(tbl$Global_active_power, na.rm = TRUE),
         type = "l",
         xaxt = "n",
         ylab = "Global Active Power (kilowatts)",
         xlab = "")
    axis(1,
        at = seq(min(tbl$datetime), max(tbl$datetime), length.out = length(unique(tbl$Weekday)) + 1),
        labels = c(unique(tbl$Weekday), weekdays(as.Date(max(tbl$Date), format = "%d/%m/%Y") + 1, abbreviate = TRUE))
    )
    dev.copy(png,"plot2.png")
    dev.off()
    
}
