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

head(plot_data)

if(!file.exists('figures')) dir.create('figures')
#width of 480 pixels and heeight of 480 pixel
png(filename = './figures/plot1.png', width = 480, height = 480, units='px')


#plot histogram
hist(plot_data$Global_active_power,col="red",xlab="Global active power(kilowatts)",main="Global ACtive Power")

#device off
dev.off()



