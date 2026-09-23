#reading data from file
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
View(data)

#changing format of date
sample$DateTime <- strptime(
  +     paste(sample$Date, sample$Time),
  +     format = "%Y-%m-%d %H:%M:%S")
  + 
 
  #creating line chart with the Global active power column
plot(sample$Global_active_power,
     +      type = "l",
     +      xaxt = "n",
     +      xlab = "",
     +      ylab = "Global Active Power (kilowatts)",
     +      main = "")

  axis(1,
         +      at = c(1, 1441, 2881),
         +      labels = c("Thu", "Fri", "Sat")) #using date/time to plot days
   
#creating line chart in a png file
png("plot2.png")
plot(sample$Global_active_power,
       +      type = "l",
       +      xaxt = "n",
       +      xlab = "",
       +      ylab = "Global Active Power (kilowatts)",
       +      main = "")

 axis(1,
         +      at = c(1, 1441, 2881),
         +      labels = c("Thu", "Fri", "Sat"))
dev.off()
