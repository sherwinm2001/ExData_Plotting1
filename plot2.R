data<-read.table("household_power_consumption.txt", sep=";", header = TRUE)
data<-data[(data$Date %in% c("1/2/2007","2/2/2007")),]
data$Global_active_power<-as.numeric(data$Global_active_power)
par("mar"=c(5,5,5,5))
datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
plot(datetime,data$Global_active_power,type="l",xlab="",ylab = "Global Active Power (kilowatts)")
dev.copy(png,"plot2.png",480,480)
dev.off()