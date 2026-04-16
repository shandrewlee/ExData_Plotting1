plot1 <- function(){
    
    source("get_tbl.R")
    tbl <- get_tbl()
    
    hist(as.numeric(tbl$Global_active_power), main = "Global Active Power", col = "red", 
         xlab = "Global Active Power (kilowatts)")
    
    dev.copy(png, "plot1.png", width = 480, height = 480)
    dev.off()
    
}
