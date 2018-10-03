data1 <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(data1) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
data1.1 <- subset(data1,data1$Date=="1/2/2007" | data1$Date =="2/2/2007")

#Use it to plot the graph
hist(as.numeric(as.character(data1.1$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")

# Graph Title
title(main="Global Active Power")

#Use it to save the plot
png("plot1.png", width=480, height=480)
hist(as.numeric(as.character(data1.1$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
dev.off()