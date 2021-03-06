# loading the data
PowerConsumption  <- read.table(file="./exdata-data-household_power_consumption/household_power_consumption.txt",header=TRUE,sep=";")
PowerConsumption$Date <- as.Date(PowerConsumption$Date, "%d/%m/%Y")
names(PowerConsumption)
head(PowerConsumption)
nrow(PowerConsumption)
object.size(PowerConsumption) # 91853280 bytes

# subsetting February 1 st and 2 nd days of 2007 Year
PCDate<-subset(PowerConsumption,PowerConsumption$Date == "2007-2-1" | PowerConsumption$Date == "2007-2-2",select=Date:Sub_metering_3) 

object.size(PCDate) #808288 bytes

PCDate$Date <- strptime(paste(PCDate$Date,PCDate$Time), "%Y-%m-%d %H:%M:%S") # Concatinating date and time into Date 
head(PCDate$Global_active_power)

hist(as.integer(PCDate$Global_active_power),col="red",main="Global Active Power",xlab="Global Active Power(Kilowatts)",breaks=12,axes=FALSE)
axis(1,1:4,c(0,2,4,6)) # X axis
axis(2,pretty(0:1200)) # Y axis

dev.copy(png, file= "plot1.png",width = 480, height = 480)
dev.off()
