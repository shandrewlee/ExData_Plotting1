library(dplyr)

get_tbl <- function(){
    
    tbl <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
    tbl <- tbl %>%
        subset(Date == "1/2/2007" | Date == "2/2/2007") %>%
        mutate(
            Weekday = weekdays(as.Date(Date, format = "%d/%m/%Y"), abbreviate = TRUE),
            datetime = as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")
        )
    tbl
    
}