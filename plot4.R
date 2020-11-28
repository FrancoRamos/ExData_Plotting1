library(lubridate)
getwd()
df <- read.csv2("household_power_consumption.txt")

df$Date <- as.Date(df$Date, "%d/%m/%Y")
df <- df[df$Date %in% c(as.Date("2007-02-01"), as.Date("2007-02-02")), ] 

df$Global_active_power <- as.character(df$Global_active_power)
df$Global_active_power <- as.numeric(df$Global_active_power)

df$Sub_metering_1 <- as.character(df$Sub_metering_1)
df$Sub_metering_1 <- as.numeric(df$Sub_metering_1)

df$Sub_metering_2 <- as.character(df$Sub_metering_2)
df$Sub_metering_2 <- as.numeric(df$Sub_metering_2)

df$Sub_metering_3 <- as.character(df$Sub_metering_3)
df$Sub_metering_3 <- as.numeric(df$Sub_metering_3)

df$Global_reactive_power <- as.character(df$Global_reactive_power)
df$Global_reactive_power <- as.numeric(df$Global_reactive_power)

df$Voltage <- as.character(df$Voltage)
df$Voltage <- as.numeric(df$Voltage)

df$datetime <- ymd_hms(paste(df$Date, df$Time))

par(mfrow=c(2,2))
plot(df$datetime, df$Global_active_power, type="l", ylab = "Global Active Power", xlab=NA)

plot(df$datetime, df$Voltage, type="l", ylab = "Voltage", xlab="datetime")

plot(df$datetime, df$Sub_metering_1, ylab= "Energy sub metering", type = "n", xlab = NA)
lines(df$datetime, df$Sub_metering_1, col="black")
lines(df$datetime, df$Sub_metering_2, col="red")
lines(df$datetime, df$Sub_metering_3, col="blue")
legend("topright", inset =0.008, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"), lty=1, box.lty=0,cex=0.75)

plot(df$datetime, df$Global_reactive_power, type="l", xlab="datetime")


dev.copy(png, "plot4.png", width  = 480,
         height = 480)
dev.off()
par(mfrow=c(1,1))

