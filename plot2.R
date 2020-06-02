powerFile <- "household_power_consumption.txt"  ##  name for text data
tbl <- read.table(powerFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") ## read the data in table
subSettbl <- tbl[tbl$Date %in% c("1/2/2007","2/2/2007") ,]


datetime1 <- strptime(paste(subSettbl$Date, subSettbl$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSettbl$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime1, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off() 
