# Read in only the required 2 days of data rather than the full dataset 
EPowerCons <- read.table("household_power_consumption.txt", header = FALSE, 
                         sep = ";", na.strings = "?", skip = 66637, 
                         nrows = 2880)

# Provide the respective names to the columns
names(EPowerCons) <- c("Date", "Time", "Global_active_power", 
                       "Global_reactive_power", "Voltage", "Global_intensity", 
                       "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

# Plot 2 requires a plot displaying the Global Active Power over time. 
# Subset this column
GlobalActivePower <- EPowerCons$Global_active_power

# Coerce Date and Time columns using strptime
TimePeriod <- strptime(paste(EPowerCons$Date, EPowerCons$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

# Initialise the png file device and its dimensions
png(filename = "plot2.png", width = 480, height = 480, units = "px")

# create a plot
plot(TimePeriod, GlobalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

# close device
dev.off()
