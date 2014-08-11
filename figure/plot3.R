data  <- read.table(file="./exdata-data-household_power_consumption/household_power_consumption.txt",header=TRUE,sep=";")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
part1 <- subset(data, data$Date=="2007-02-01")
part2 <- subset(data, data$Date=="2007-02-02")
new_data <- rbind(part1, part2)
new_data$Date <- as.POSIXct(paste(new_data$Date,new_data$Time), "%d/%m/%Y %H:%M:%S") # changing to POSIX

plot(new_data$Date,new_data$Global_active_power,col = "black", xlab="", ylab="Global Active Power(Kilowatts)",type="l")
axis(2,pretty(1:6,n=2))

dev.copy(png, file= "plot2.png",width = 480, height = 480)
dev.off()
