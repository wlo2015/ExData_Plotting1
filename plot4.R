#
# Download the dataset file from the course website 
#

power_url <- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(power_url, "pwr_consumption.zip")
unzip("pwr_consumption.zip", exdir = "pwrdata")

###########################################################################################
#
# Start at here if you have already run another plot .R files to skip the download process.
#
###########################################################################################
#
# Read the file into R
#

pwr <- read.table("./pwrdata/household_power_consumption.txt", sep = ";", header = TRUE)

#
# Subset the desired portion from the big data file
#

pwr1 <- pwr[which(pwr$Date == "2/2/2007" | pwr$Date == "1/2/2007"),]

#
# Convert the Date column to date type with time and
# change the header name to 'datetime'
#

pwr1$Date <- strptime(paste(pwr1$Date, pwr1$Time), "%d/%m/%Y %H:%M:%S")
colnames(pwr1)[1] <- "datetime"

#
# Plot 4 graphs and save to the file
#

png(file = "plot4.png")

par(mfcol = c(2,2))
plot(pwr1$datetime, levels(pwr1[,3])[pwr1[,3]], type="l", xlab = "", ylab = "Global Active Power (kilowatts)")
plot(pwr1$datetime, levels(pwr1[,7])[pwr1[,7]], type="l", xlab = "", ylab = "Energy sub metering")
points(pwr1$datetime, levels(pwr1[,8])[pwr1[,8]], type="l", col="red")
points(pwr1$datetime, pwr1[,9], type="l", col="blue")
legend("topright", bty = "n", lwd=1, col = c("black", "red", "blue"), legend = c(names(pwr1)[7], names(pwr1)[8], names(pwr1)[9]))
plot(pwr1$datetime, levels(pwr1[,5])[pwr1[,5]], type="l", xlab = colnames(pwr1)[1], ylab = colnames(pwr1)[5])
plot(pwr1$datetime, levels(pwr1[,4])[pwr1[,4]], type="l", xlab = colnames(pwr1)[1], ylab = colnames(pwr1)[4])

dev.off()
