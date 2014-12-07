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

#Plot 2
par("cex.lab"=0.75)
plot(edadata$Newdate, edadata$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png")
dev.off()