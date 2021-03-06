library(lubridate)
getwd()
df <- read.csv2("household_power_consumption.txt")

df$Date <- as.Date(df$Date, "%d/%m/%Y")
df <- df[df$Date %in% c(as.Date("2007-02-01"), as.Date("2007-02-02")), ] 

df$Sub_metering_1 <- as.character(df$Sub_metering_1)
df$Sub_metering_1 <- as.numeric(df$Sub_metering_1)

df$Sub_metering_2 <- as.character(df$Sub_metering_2)
df$Sub_metering_2 <- as.numeric(df$Sub_metering_2)

df$Sub_metering_3 <- as.character(df$Sub_metering_3)
df$Sub_metering_3 <- as.numeric(df$Sub_metering_3)

df$datetime <- ymd_hms(paste(df$Date, df$Time))

plot(df$datetime, df$Sub_metering_1, ylab= "Energy sub metering", type = "n", xlab = NA)
lines(df$datetime, df$Sub_metering_1, col="black")
lines(df$datetime, df$Sub_metering_2, col="red")
lines(df$datetime, df$Sub_metering_3, col="blue")

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"), lty=1)


dev.copy(png, "plot3.png")
dev.off()
