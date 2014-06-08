#Read the original input file
input <- read.table("household_power_consumption.txt", sep = ";", header = TRUE);
#Keep only rows for day 2007-02-01 and 2007-02-02
twoDayInput <- input[input$Date == "1/2/2007" | input$Date == "2/2/2007",];
#Generate a new input file for two-day's records
write.table(twoDayInput, file = "two_day_household_power_consumption.txt", quote = FALSE, sep = ",", row.names = FALSE);
#Read the input file with only two day's records
twoDayInput <- read.table("two_day_household_power_consumption.txt", sep = ",",  header = TRUE, as.is = TRUE);

#Generate correct date and time format
twoDayInput$newDate <- as.Date(twoDayInput$Date,"%d/%m/%Y");
twoDayInput$DateTimeString <- paste(twoDayInput$newDate, twoDayInput$Time);
twoDayInput$DateTime <- strptime(twoDayInput$DateTimeString, format = "%Y-%m-%d %H:%M:%S");

#Generate plot3.png and save it
with(twoDayInput,plot(DateTime, Sub_metering_1, type = "n", ylab = "Energy submetering", xlab = ""));
with(twoDayInput,lines(DateTime, Sub_metering_1, col = "grey"));
with(twoDayInput,lines(DateTime, Sub_metering_2, col = "red"));
with(twoDayInput,lines(DateTime, Sub_metering_3, col = "blue"));
legend("topright", lty = 1, lwd = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"));
dev.copy(png,file = "plot3.png");
dev.off();







