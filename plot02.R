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


## Creating directory if not already created:
if( !file.exists("./week01/plots") ){
    dir.create("./week01/plots")
}

## STARTING A GRAPHIC DEVICE:
png(filename = "./week01/plots/plot02.png", width = 480, height = 480, units = "px")

## PLOT02:
with(foo, plot(x = date_time, y = Global_active_power, type = "l",
               ylab = "Global Active Power (kilowatts)",
               xlab = ""))

dev.off()
