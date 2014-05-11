InData<-read.table("household_power_consumption.txt",
                   header = TRUE,
                   sep=";",
                   na.strings=c("?"))
InData <- InData[ which(InData$Date=="1/2/2007" 
                        | InData$Date=="2/2/2007"), ]
InData$DT <- strptime(paste(InData$Date, InData$Time), "%d/%m/%Y %H:%M:%S")

## Plot 2
plot(InData$DT,InData$Global_active_power, 
     type="l",
     xlab= NA,
     ylab="Global Active Power (kilowatts)"
)