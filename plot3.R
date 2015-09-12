setwd("C:/Users/PC/Desktop/R/Explor/project 1")

# Read only the data for 01/02/2007 and 02/02/2007. 

electric <- read.table("household_power_consumption.txt", sep = ";",
                       skip = grep("^31/1/2007;23:59:00", 
                                   readLines("household_power_consumption.txt")), 
                       nrows = 2880, na.strings = "?")

# Give names to the variables in electric data frame.
names(electric) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", 
                     "Voltage", "Global_intensity", "Sub_metering_1", 
                     "Sub_metering_2", "Sub_metering_3")

# Convert Date and Time variables to Date and POSIXlt classes respectively
electric$Date <- as.Date(electric$Date, format="%d/%m/%Y")
electric$Time <- paste(electric$Date, electric$Time)
electric$Time <- strptime(electric$Time, format = "%Y-%m-%d %H:%M:%S")

# Creating the plot 3:

png("plot3.png", width=480, height=480)
plot(electric$Time, electric$Sub_metering_1, 
                      type="l", xlab="", ylab="Energy sub metering", col = "black")
lines(electric$Time, electric$Sub_metering_2, col = "red")
lines(electric$Time, electric$Sub_metering_3, col = "blue")
legend("topright",  c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()