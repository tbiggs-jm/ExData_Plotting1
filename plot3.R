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

 
  #creating line chart
plot(sample$Sub_metering_1,
     +      type = "S",
     +      xaxt = "n",
     +      xlab = "",
     +      ylab = "Energy sub metering",
     +      main = "",
     +      col = "black")

   lines(sample$Sub_metering_2,
          +       type = "S",
          +       col = "red")
 
   lines(sample$Sub_metering_3,
          +       type = "S",
          +       col = "blue")
 
   axis(1,
         +      at = c(1, 1441, 2881),
         +      labels = c("Thu", "Fri", "Sat"))
 
   legend("topright",
           +        legend = c("Sub_metering_1",
                               +                   "Sub_metering_2",
                               +                   "Sub_metering_3"),
           +        col = c("black", "red", "blue"),
           +        lty = 1)

   #creating line chart in a png file
png("plot3.png")
plot(sample$Sub_metering_1,
     +      type = "S",
     +      xaxt = "n",
     +      xlab = "",
     +      ylab = "Energy sub metering",
     +      main = "",
     +      col = "black")
 
   lines(sample$Sub_metering_2,
          +       type = "S",
          +       col = "red")
 
   lines(sample$Sub_metering_3,
          +       type = "S",
          +       col = "blue")
 
   axis(1,
         +      at = c(1, 1441, 2881),
         +      labels = c("Thu", "Fri", "Sat"))
 
   legend("topright",
           +        legend = c("Sub_metering_1",
                               +                   "Sub_metering_2",
                               +                   "Sub_metering_3"),
           +        col = c("black", "red", "blue"),
           +        lty = 1)
 dev.off()
