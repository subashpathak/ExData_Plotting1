getwd()
setwd("C:/Users/spathak/Desktop")

if(!file.exists('explore')) dir.create('explore')
fileUrl <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
download.file(fileUrl, destfile = './explore/household_power_consumption.zip')
unzip('./explore/household_power_consumption.zip', exdir = './explore')

#read the data
power<-read.table("./explore/household_power_consumption.txt",sep=";",header=TRUE, na.strings="?")

head(power)
#data for plotting

plot_data<-power[power$Date %in% c("1/2/2007","2/2/2007"),]

#format dates
datetime <- strptime(paste(plot_data$Date, plot_data$Time), format="%d/%m/%Y %H:%M:%S")


if(!file.exists('figures')) dir.create('figures')
#width of 480 pixels and heeight of 480 pixel
png(filename = './figures/plot4.png', width = 480, height = 480, units='px')

par(mfrow=c(2,2))
# plot figure

#plots
plot(datetime,plot_data$Global_active_power,type="l",col="black",ylab="Global active power(kilowatts)")
plot(datetime,plot_data$Voltage,type="l",col="black",ylab="Voltage")

plot(datetime, plot_data$Sub_metering_1,ylab = 'Energy sub metering', type = 'l')
lines(datetime, plot_data$Sub_metering_2, col = 'red')
lines(datetime, plot_data$Sub_metering_3, col = 'blue')
legend('topright', col = c('black', 'red', 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lwd = 1)
plot(datetime,plot_data$Global_reactive_power,type="l",col="black",ylab="Global reactive power(kilowatts)")

# close device
dev.off()
