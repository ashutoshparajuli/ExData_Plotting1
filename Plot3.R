data3 <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(data3) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
data3.1 <- subset(data3,data3$Date=="1/2/2007" | data3$Date =="2/2/2007")
# Set the working directory that contains the data file

data3.1$Date <- as.Date(data3.1$Date, format="%d/%m/%Y")
data3.1$Time <- strptime(data3.1$Time, format="%H:%M:%S")
data3.1[1:1440,"Time"] <- format(data3.1[1:1440,"Time"],"2007-02-01 %H:%M:%S")
data3.1[1441:2880,"Time"] <- format(data3.1[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


#Use it to create the graph

plot(data3.1$Time,data3.1$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
with(data3.1,lines(Time,as.numeric(as.character(Sub_metering_1))))
with(data3.1,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
with(data3.1,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# Title

title(main="Energy sub-metering")

#This will save the plot into png file

png("plot3.png", width=480, height=480)
plot(data3.1$Time,data3.1$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
with(data3.1,lines(Time,as.numeric(as.character(Sub_metering_1))))
with(data3.1,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
with(data3.1,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()