setwd("C:/Users/bcw10/Documents/Coursera/Proj1/")

#Output device to PNG
png("plot2.png", width=480, height=480)

#Read, name & subset power consumption data

power_data <- read.table("household_power_consumption.txt", skip=1, sep=";")
names(power_data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
sub_power <- subset(power_data, power_data$Date=="1/2/2007" | power_data$Date=="2/2/2007")

# Transforming the Date and Time vars from characters into objects of type Date and POSIXlt respectively
sub_power$Date <- as.Date(sub_power$Date, format="%d/%m/%Y")
sub_power$Time <- strptime(sub_power$Time, format="%H:%M:%S")
sub_power[1:1440,"Time"] <- format(sub_power[1:1440,"Time"],"2007-02-01 %H:%M:%S")
sub_power[1441:2880,"Time"] <- format(sub_power[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

#Basic plot function
plot(sub_power$Time,as.numeric(as.character(sub_power$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)", 
     main = "Global Active Power Vs Time") 


dev.off()