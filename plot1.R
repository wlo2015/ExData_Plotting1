#
# Download the dataset file from the course website 
#

power_url <- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(power_url, "pwr_consumption.zip")
unzip("pwr_consumption.zip", exdir = "pwrdata")

#
# Start at here if you have already run another plot .R files to skip the download process.
#

#
# Read the file into R
#

pwr <- read.table("./pwrdata/household_power_consumption.txt", sep = ";", header = TRUE)

#
# Subset the desired portion from the big data file
#

pwr1 <- pwr[which(pwr$Date == "2/2/2007" | pwr$Date == "1/2/2007"),]

#
# Plot the histogram with the required features
#

hist(as.numeric(as.character(pwr2$Global_active_power)), main="Global Active Power", col="red", xlab = "Global Active Power (kilowatts)")

#
# Save the plot to the file in 'png' format
#

dev.copy(png, file = "plot1.png")
dev.off()