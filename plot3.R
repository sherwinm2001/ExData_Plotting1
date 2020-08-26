data<-read.table("household_power_consumption.txt", sep=";", header = TRUE)
data<-data[(data$Date %in% c("1/2/2007","2/2/2007")),]
data$Sub_metering_1<-as.numeric(data$Sub_metering_1)
data$Sub_metering_2<-as.numeric(data$Sub_metering_2)
data$Sub_metering_3<-as.numeric(data$Sub_metering_3)
par("mar"=c(5,5,5,5))
datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
plot(datetime,data$Sub_metering_1,type="l",xlab="",ylab = "Energy sub metering")
lines(datetime, data$Sub_metering_2, col="red")
lines(datetime, data$Sub_metering_3, col="blue")
legend("topright", lty=1, lwd=1, legend = c("Sub_metering_1", "Sub_metering_2", 
                                            "Sub_metering_3"), col=c("black", "red", "blue"))
dev.copy(png,"plot3.png",480,480)
dev.off()
