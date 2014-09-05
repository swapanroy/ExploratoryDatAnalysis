setwd("/Users/swapanroy/Desktop/Swapan/Personal/R/")

## Getting full dataset
Household_Data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                           nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
# Format Date
Household_Data$Date <- as.Date(Household_Data$Date, format="%d/%m/%Y")

## Subsetting the data for the needed date range
data <- subset(Household_Data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(Household_Data)

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)
dev.off()

## Plot 3
with(data, {
        plot(Sub_metering_1~Datetime, type="l",
             ylab="Global Active Power (kilowatts)", xlab="")
        lines(Sub_metering_2~Datetime,col='Red')
        lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## was having error in displaying of plot and with Sys.sleep(1) it worked
Sys.sleep(1)
dev.off()
## Saving to file
dev.copy( png,file="plot3.png", height=480, width=480)
dev.off()