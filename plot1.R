data<-read.table("household_power_consumption.txt", sep=";", header = TRUE)
data<-data[(data$Date %in% c("1/2/2007","2/2/2007")),]
data$Global_active_power<-as.numeric(data$Global_active_power)
par("mar"=c(5,5,5,5))
hist(data$Global_active_power,xlab="Global Active Power (kilowatts)",main = "Global Active Power", col="red")
dev.copy(png,"plot1.png",480,480)
dev.off()