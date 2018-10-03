# Set the working directory that contains the data file

data2 <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(data2) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
data2.1 <- subset(data2,data2$Date=="1/2/2007" | data2$Date =="2/2/2007")

data2.1$Date <- as.Date(data2.1$Date, format="%d/%m/%Y")
data2.1$Time <- strptime(data2.1$Time, format="%H:%M:%S")
data2.1[1:1440,"Time"] <- format(data2.1[1:1440,"Time"],"2007-02-01 %H:%M:%S")
data2.1[1441:2880,"Time"] <- format(data2.1[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


#Use it to plot the graph

plot(data2.1$Time,as.numeric(as.character(data2.1$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)") 

# Graph Title

title(main="Global Active Power Vs Time")

#Creates the required png file

png("plot2.png", width=480, height=480)
plot(data2.1$Time,as.numeric(as.character(data2.1$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)") 
dev.off()