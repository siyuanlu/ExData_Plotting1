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
plot(twoDayInput$DateTime, twoDayInput$Global_active_power, type = "n", xlab = "", ylab = "Global Active Power (kilowatts)");
lines(twoDayInput$DateTime, twoDayInput$Global_active_power);

#Save the drawing to plot3.png
dev.copy(png,file = "plot2.png");
dev.off();