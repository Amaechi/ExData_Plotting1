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

# Plot 3 requires a plot displaying the Energy Sub-metering over time.
# Subset this column
SubMetering <- select(EPowerCons, Sub_metering_1:Sub_metering_3)

# Coerce Date and Time columns using strptime
TimePeriod <- strptime(paste(EPowerCons$Date, EPowerCons$Time, sep = " "), 
                       "%d/%m/%Y %H:%M:%S")

# Initialise the png file device and its dimensions
png(filename = "plot3.png", width = 480, height = 480, units = "px")

# create a plot and annotate
plot(TimePeriod, SubMetering$Sub_metering_1, type="l", 
     ylab="Energy sub metering", xlab="")
lines(TimePeriod, SubMetering$Sub_metering_2, type="l", col="red")
lines(TimePeriod, SubMetering$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, lwd=3, col=c("black", "red", "blue"))

# close device
dev.off()