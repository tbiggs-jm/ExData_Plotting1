#reading data from file
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
View(data)

#changing format of date
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

#creating a subset of the data based on February 1 and February 2
sample <- subset(
  +     data,
  +     Date %in% c("2007-02-01", "2007-02-02"))

#changing format of date/time
sample$DateTime <- strptime(
  +     paste(sample$Date, sample$Time),
  +     format = "%Y-%m-%d %H:%M:%S")

 
  #creating plot
par(mfrow = c(2, 2))
plot(sample$DateTime, sample$Global_active_power,
       +      type = "l",
       +      xlab = "",
       +      ylab = "Global Active Power (kilowatts)")
plot(sample$DateTime, sample$Voltage,
       +      type = "l",
       +      xlab = "datetime",
       +      ylab = "Voltage")
plot(sample$DateTime, sample$Sub_metering_1,
       +      type = "l",
       +      col = "black",
       +      xlab = "",
       +      ylab = "Energy sub metering")
 
  lines(sample$DateTime, sample$Sub_metering_2,
          +       col = "red")

   lines(sample$DateTime, sample$Sub_metering_3,
          +       col = "blue")

   legend("topright",
           +        legend = c("Sub_metering_1",
                               +                   "Sub_metering_2",
                               +                   "Sub_metering_3"),
           +        col = c("black", "red", "blue"),
           +        lty = 1)
 plot(sample$DateTime, sample$Global_reactive_power,
       +      type = "l",
       +      xlab = "datetime",
       +      ylab = "Global_reactive_power")

   #creating plot in a png file
png("plot4.png")
par(mfrow = c(2, 2))
 plot(sample$DateTime, sample$Global_active_power,
       +              type = "l",
       +              xlab = "",
       +              ylab = "Global Active Power (kilowatts)")
  plot(sample$DateTime, sample$Voltage,
        +              type = "l",
        +              xlab = "datetime",
        +              ylab = "Voltage")
  plot(sample$DateTime, sample$Sub_metering_1,
        +              type = "l",
        +              col = "black",
        +              xlab = "",
        +              ylab = "Energy sub metering")
  
        lines(sample$DateTime, sample$Sub_metering_2,
               +                    col = "red")
  
        lines(sample$DateTime, sample$Sub_metering_3,
               +                    col = "blue")
  
        legend("topright",
                +                      legend = c("Sub_metering_1",
                                                  +                                                     "Sub_metering_2",
                                                  +                                                     "Sub_metering_3"),
                +                      col = c("black", "red", "blue"),
                +                      lty = 1)
  plot(sample$DateTime, sample$Global_reactive_power,
        +              type = "l",
        +             xlab = "datetime",
        +             ylab = "Global_reactive_power")
 dev.off()
