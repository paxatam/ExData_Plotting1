data <- read.table("household_power_consumption.txt", skip = 66637, nrow = 2880, sep = ";", dec = ".", header = FALSE, colClasses = c("character","character","character","character","character","character","character","character","character"))
colnames(data) <- c("Date","Time","Global_Active_Power","Global_Reactive_Power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
x <- paste(data$Date,data$Time)
date_time <- strptime(x, format = "%d/%m/%Y %H:%M:%S")
png("plot4.png",width = 480, height = 480, units = "px")
par(mfrow = c(2,2))

#plot 1
plot(date_time,data$Global_Active_Power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

#plot 2
plot(date_time, data$Voltage, xlab = "datetime", ylab = "Voltage", type = "l")

#plot 3
plot(date_time,data$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "", col = "black")
lines(date_time, data$Sub_metering_2, col = "red")
lines(date_time, data$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lty = 1)

#plot 4
plot(date_time, data$Global_Reactive_Power, xlab = "datetime", ylab = "Global_reactive_power", type = "l")