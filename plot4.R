InData<-read.table("household_power_consumption.txt",
                   header = TRUE,
                   sep=";",
                   na.strings=c("?"))
InData <- InData[ which(InData$Date=="1/2/2007" 
                        | InData$Date=="2/2/2007"), ]
InData$DT <- strptime(paste(InData$Date, InData$Time), "%d/%m/%Y %H:%M:%S")

## Plot 4
## Set parameters for 4 plots per screen
par(mfrow = c(2, 2))


## Old Plot 2
plot(InData$DT,InData$Global_active_power, 
     type="l",
     xlab= NA,
     ylab="Global Active Power (kilowatts)"
)

## Additional plot A
plot(InData$DT,InData$Voltage, 
     type="l",
     xlab= "datetime",
     ylab="Voltage"
)


## Old Plot 3
plot(InData$DT,InData$Sub_metering_1, 
     type="l",
     xlab= NA,
     ylab="Energy sum metering"
)
# add line 2
lines(InData$DT,InData$Sub_metering_2,
      type="l",
      col="red") 
# add line 3
lines(InData$DT,InData$Sub_metering_3,
      type="l",
      col="blue")
# add a legend 
legend("topright", 
       c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), # puts text in the legend 
       lty=c(1,1), # gives the legend appropriate symbols (lines)
       lwd=c(1,1),col=c("black","red", "blue"), # gives the legend lines the correct color and width
       cex=.75
)

## Additional plot B
plot(InData$DT,InData$Global_reactive_power, 
     type="l",
     xlab= "datetime",
     ylab="Global_reactive_power"
)
