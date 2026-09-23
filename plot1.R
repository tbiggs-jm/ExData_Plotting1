#reading data from file
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
 View(data)

#changing format of date
 data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

  #creating a subset of the data based on February 1 and February 2
sample <- subset(
    +     data,
    +     Date %in% c("2007-02-01", "2007-02-02"))
  
  #changing datatype of the Global Active Power data
  sample$Global_active_power <- as.numeric(sample$Global_active_power)
  
 #creating histogram with the Global active power column
   hist(sample$Global_active_power,
       +      xlab = "Global Active Power (kilowatts)",
       +      ylab = "Frequency",
       +      main = "Global Active Power",
       +      col = "red",
       +           xaxt = "n")
  
     axis(1, at = seq(0, 6, by = 2))
   
#creating histogram in a png file
   png("plot1.png")
   hist(sample$Global_active_power,
        +      xlab = "Global Active Power (kilowatts)",
        +      ylab = "Frequency",
        +      main = "Global Active Power",
        +      col = "red",xaxt = "n")
   axis(1, at = seq(0, 6, by = 2))
   
dev.off()
