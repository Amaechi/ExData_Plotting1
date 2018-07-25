# Include relevant libraries
library(dplyr)

# Read in only the required 2 days of data rather than the full dataset 
EPowerCons <- read.table("household_power_consumption.txt", header = FALSE, 
                         sep = ";", na.strings = "?", skip = 66637, 
                         nrows = 2880)

# Provide the respective names to the columns
names(EPowerCons) <- c("Date", "Time", "Global_active_power", 
                       "Global_reactive_power", "Voltage", "Global_intensity", 
                       "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

# Plot 4 requires 4 different plots. Subset required columns
GlobalActivePower <- EPowerCons$Global_active_power

GlobalReactivePower <- EPowerCons$Global_reactive_power

Voltage <- EPowerCons$Voltage

SubMetering <- select(EPowerCons, Sub_metering_1:Sub_metering_3)

# Coerce Date and Time columns using strptime
TimePeriod <- strptime(paste(EPowerCons$Date, EPowerCons$Time, sep = " "), 
                       "%d/%m/%Y %H:%M:%S")


# Initialise the png file device and its dimensions
png(filename = "plot4.png", width = 480, height = 480, units = "px")

# Select a 2 by 2 plot display
par(mfrow = c(2, 2)) 

# Create 1st plot 
plot(TimePeriod, GlobalActivePower, type="l", xlab="", 
     ylab="Global Active Power (kilowatts)", cex = 0.2)

# Create 2nd plot
plot(TimePeriod, Voltage, type="l", xlab="datetime", ylab="Voltage")

# Create 3rd plot and annotate
plot(TimePeriod, SubMetering$Sub_metering_1, type="l", 
     ylab="Energy sub metering", xlab="")
lines(TimePeriod, SubMetering$Sub_metering_2, type="l", col="red")
lines(TimePeriod, SubMetering$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, lwd=3, col=c("black", "red", "blue"))

# Create 4th plot
plot(TimePeriod, GlobalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

# close device
dev.off()
