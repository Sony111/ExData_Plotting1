# Load the data
data  <- read.table(file="./exdata-data-household_power_consumption/household_power_consumption.txt",header=TRUE,sep=";")
data$Date <- as.Date(data$Date, "%Y-%m-%d")
# Extract Feb 1 st and 2 nd date data
part1 <- subset(data, data$Date=="2007-02-01")
part2 <- subset(data, data$Date=="2007-02-02")
new_data <- rbind(part1, part2)
new_data$Date <- strptime(paste(new_data$Date,new_data$Time), "%Y-%m-%d %H:%M:%S") # Concatinate date,time into Date

par(mfrow=c(2,2)) #row wise plotting graphs
par(mar=c(4,4,2,2))

plot(new_data$Date,new_data$Global_active_power,col = "black", xlab="", ylab="Global Active Power(Kilowatts)",type="l")
plot(new_data$Date,new_data$Voltage,col = "black", xlab="datetime", ylab="Voltage",type="l")
plot(new_data$Date, new_data$Sub_metering_1, col = "black", xlab="", ylab="Energy sub metering",type="l")
lines(new_data$Date, new_data$Sub_metering_2, col = "red")
lines(new_data$Date, new_data$Sub_metering_3, col = "blue")
legend("topright",col = c("black", "red", "blue"),legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1)
plot(new_data$Date,new_data$Global_reactive_power,col = "black", xlab="datetime", ylab="Global_reactive_power",type="l")


dev.copy(png, file= "plot4.png",width = 480, height = 480)
dev.off()
