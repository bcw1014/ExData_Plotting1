#Output device to PNG
png("plot1.png", width=480, height=480)

#Read, name & subset power consumption data

power_data <- read.table("household_power_consumption.txt", skip=1, sep=";")
names(power_data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
sub_power <- subset(power_data, power_data$Date=="1/2/2007" | power_data$Date=="2/2/2007")

#Basic plot function
hist(as.numeric(as.character(sub_power$Global_active_power)), col="red", main="Global Active Power",xlab="Global Active Power(kilowatts)")


dev.off()