# Read in only the required 2 days of data rather than the full dataset 
EPowerCons <- read.table("household_power_consumption.txt", header = FALSE, 
                         sep = ";", na.strings = "?", skip = 66637, 
                         nrows = 2880)

# Provide the respective names to the columns
names(EPowerCons) <- c("Date", "Time", "Global_active_power", 
                       "Global_reactive_power", "Voltage", "Global_intensity", 
                       "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

# Plot 1 requires a simple histogram displaying frequency of the Global Active
# power column. Subset this column
GlobalActivePower <- EPowerCons$Global_active_power

# Initialise the png file device and its dimensions
png(filename = "plot1.png", width = 480, height = 480, units = "px")

# create a histogram
hist(GlobalActivePower, breaks = 12, main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency", 
     col = "red")

# close device
dev.off()
