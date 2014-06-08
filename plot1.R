#Read the original input file
input <- read.table("household_power_consumption.txt", sep = ";", header = TRUE);
#Keep only rows for day 2007-02-01 and 2007-02-02
twoDayInput <- input[input$Date == "1/2/2007" | input$Date == "2/2/2007",];
#Generate a new input file for two-day's records
write.table(twoDayInput, file = "two_day_household_power_consumption.txt", quote = FALSE, sep = ",", row.names = FALSE);
#Read the input file with only two day's records
twoDayInput <- read.table("two_day_household_power_consumption.txt", sep = ",",  header = TRUE);

#Draw a histogram for Global_active_power
#Change the name for x-lable, add main title and set the fill color to be red
#Save the drawing to plot1.png
hist(twoDayInput$Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red");
dev.copy(png,file = "plot1.png");
dev.off();
