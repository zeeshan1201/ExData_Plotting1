# The data should be in the current folder
epcdata <- read.table("./household_power_consumption.txt", sep =";", header = TRUE)
epcdata$Newdate <- as.POSIXlt(strptime(paste(epcdata$Date, epcdata$Time), format= "%d/%m/%Y %H:%M:%S"))
epcdata$Date <- as.Date(epcdata$Date,"%d/%m/%Y")
edadata <- subset(epcdata, Date == "2007-02-01" | Date == "2007-02-02")

#Convert the numeric variables into the class-numeric from class-factor

edadata$Global_active_power <- as.numeric(levels(edadata$Global_active_power))[edadata$Global_active_power]
edadata$Sub_metering_1 <- as.numeric(levels(edadata$Sub_metering_1))[edadata$Sub_metering_1]
edadata$Sub_metering_2 <- as.numeric(levels(edadata$Sub_metering_2))[edadata$Sub_metering_2]
edadata$Voltage <- as.numeric(levels(edadata$Voltage))[edadata$Voltage]
edadata$Global_reactive_power <- as.numeric(levels(edadata$Global_reactive_power))[edadata$Global_reactive_power]

#Plot 4
par("cex.lab"=0.75)
par(mfrow = c(2,2))
plot(edadata$Newdate, edadata$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab="")

plot(edadata$Newdate, edadata$Voltage, type = "l", ylab = "Voltage", xlab="datetime")


plot(edadata$Newdate, edadata$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab="")
lines(edadata$Newdate, edadata$Sub_metering_2, type = "l", col= "red")
lines(edadata$Newdate, edadata$Sub_metering_3, type = "l", col= "blue")

legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = 1, col = c("black", "red", "blue"), cex=.75, inset = c(0.3, 0.02), bty = "n")

plot(edadata$Newdate, edadata$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab="datetime")

dev.copy(png, file="plot4.png")
dev.off()