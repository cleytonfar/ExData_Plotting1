
## LOADING THE PACKAGES:
library(dplyr)
library(data.table)
library(lubridate)

## READING THE DATA SET:
foo <- fread("./week01/data/household_power_consumption.txt", na.strings = "?")

## WORKING WITH DATE VARIABLES AND FILTERING:
foo <- foo %>% 
    mutate(date_time = dmy_hms(paste(Date, Time, sep = " ")),
           Date = as.Date(Date, format = "%d/%m/%Y")) %>% 
           filter(Date >= "2007-02-01" & Date <= "2007-02-02") %>% 
    as.data.table()


## CREATING A DIRECTORY TO SAVE THE PLOTS (IF NOT ALREADY CREATED):
if( !file.exists("./week01/plots") ){
    dir.create("./week01/plots")
}

## STARTING THE GRAPHICS DEVICE:
png(filename = "./week01/plots/plot01.png", width = 480, height = 480, units = "px")

## PLOT01:
with(foo, hist(Global_active_power, col = "red", 
               xlab = "Global Active Power (kilowatts)", 
               ylab = "Frequency",
               main = "Global Active Power"))


dev.off()







