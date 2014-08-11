data  <- read.table(file="./exdata-data-household_power_consumption/household_power_consumption.txt",header=TRUE,sep=";")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
part1 <- subset(data, data$Date=="2007-02-01")
part2 <- subset(data, data$Date=="2007-02-02")
new_data <- rbind(part1, part2)
new_data$Date <- as.POSIXct(paste(new_data$Date,new_data$Time), "%d/%m/%Y %H:%M:%S") # changing to POSIX

plot(new_data$Date, new_data$Sub_metering_1, col = "black", xlab="", ylab="Energy sub metering",type="l")
lines(new_data$Date, new_data$Sub_metering_2, col = "red")
lines(new_data$Date, new_data$Sub_metering_3, col = "blue")
legend("topright",col = c("black", "red", "blue"),legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1)

dev.copy(png, file= "plot3.png",width = 480, height = 480)
dev.off()
