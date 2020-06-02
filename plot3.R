powerFile <- "household_power_consumption.txt"  ##  name for text data
tbl <- read.table(powerFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") ## read the data in table
subSettbl <- tbl[tbl$Date %in% c("1/2/2007","2/2/2007") ,]


datetime1 <- strptime(paste(subSettbl$Date, subSettbl$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSettbl$Global_active_power)

subM1 <- as.numeric(subSettbl$Sub_metering_1)
subM2 <- as.numeric(subSettbl$Sub_metering_2)
subM3 <- as.numeric(subSettbl$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(datetime1, subM1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime1, subM2, type="l", col="red")
lines(datetime1, subM3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off() 