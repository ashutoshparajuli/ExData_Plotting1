# Set the working directory that contains the data file

alldata <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(alldata) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
alldata.1 <- subset(alldata,alldata$Date=="1/2/2007" | alldata$Date =="2/2/2007")

alldata.1$Date <- as.Date(alldata.1$Date, format="%d/%m/%Y")
alldata.1$Time <- strptime(alldata.1$Time, format="%H:%M:%S")
alldata.1[1:1440,"Time"] <- format(alldata.1[1:1440,"Time"],"2007-02-01 %H:%M:%S")
alldata.1[1441:2880,"Time"] <- format(alldata.1[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


#Graph
par(mfrow=c(2,2))
with(alldata.1,{
  plot(alldata.1$Time,as.numeric(as.character(alldata.1$Global_active_power)),type="l",  xlab="",ylab="Global Active Power")  
  plot(alldata.1$Time,as.numeric(as.character(alldata.1$Voltage)), type="l",xlab="datetime",ylab="Voltage")
  plot(alldata.1$Time,alldata.1$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
   with(alldata.1,lines(Time,as.numeric(as.character(Sub_metering_1))))
   with(alldata.1,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
   with(alldata.1,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
   legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)
  plot(alldata.1$Time,as.numeric(as.character(alldata.1$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")})


#This will create the png file

png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
with(alldata.1,{
  plot(alldata.1$Time,as.numeric(as.character(alldata.1$Global_active_power)),type="l",  xlab="",ylab="Global Active Power")  
  plot(alldata.1$Time,as.numeric(as.character(alldata.1$Voltage)), type="l",xlab="datetime",ylab="Voltage")
  plot(alldata.1$Time,alldata.1$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
   with(alldata.1,lines(Time,as.numeric(as.character(Sub_metering_1))))
   with(alldata.1,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
   with(alldata.1,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
   legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)
  plot(alldata.1$Time,as.numeric(as.character(alldata.1$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")})
dev.off()