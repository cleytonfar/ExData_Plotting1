
## LOADING THE PACKAGES:
library(dplyr)
library(data.table)
library(lubridate)

## READING THE DATE:
foo <- fread("./week01/data/household_power_consumption.txt", na.strings = "?")

## FORMATTING THE DATE VARIABLES:
foo <- foo %>% 
    mutate(date_time = dmy_hms(paste(Date, Time, sep = " ")),
           Date = as.Date(Date, format = "%d/%m/%Y")) %>% 
    filter(Date >= "2007-02-01" & Date <= "2007-02-02") %>% 
    as.data.table()



## STARTING A GRAPHIC DEVICE:
png(filename = "./week01/plots/plot03.png", width = 480, height = 480, units = "px")

## PLOT03:
{

with(foo, plot(x = date_time, y = Sub_metering_1, 
               type = "l", col = "black",
               ylab = "Energy sub metering", xlab = ""))
with(foo, lines(x = date_time, y = Sub_metering_2,
                col = "red", type = "l"))
with(foo, lines(x = date_time, y = Sub_metering_3,
                col = "blue", type = "l"))
legend("topright", col = c("black", "red", "blue"), 
       lty = 1,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
}

dev.off()
