library(lubridate)
getwd()
df <- read.csv2("household_power_consumption.txt")

df$Date <- as.Date(df$Date, "%d/%m/%Y")
df <- df[df$Date %in% c(as.Date("2007-02-01"), as.Date("2007-02-02")), ] 

df$Global_active_power <- as.character(df$Global_active_power)
df$Global_active_power <- as.numeric(df$Global_active_power)

df$datetime <- ymd_hms(paste(df$Date, df$Time))

plot(df$datetime, df$Global_active_power, type="l", 
     ylab = "Global Active Power (kilowatts)")

dev.copy(png, "plot2.png", width  = 480,
         height = 480)
dev.off()
