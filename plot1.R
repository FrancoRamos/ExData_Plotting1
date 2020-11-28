getw()
df <- read.csv2("household_power_consumption.txt")
head(df)
str(df)


df$Date <- as.Date(df$Date, "%d/%m/%Y")
df <- df[df$Date %in% c(as.Date("2007-02-01"), as.Date("2007-02-02")), ] 

df$Global_active_power <- as.character(df$Global_active_power)
df$Global_active_power <- as.numeric(df$Global_active_power)

hist(df$Global_active_power, col="red", main="Global Active Power", 
     xlab = "Global Active Power (kilowatts)", ylab = "Frecuency")

dev.copy(png, "plot1.png", width  = 480,
         height = 480)
dev.off()

