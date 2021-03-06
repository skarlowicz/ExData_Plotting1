pw_cons_file <- unz("household_power_cons.zip","household_power_consumption.txt")
pw <- read.csv(pw_cons_file,header=TRUE,sep=";",stringsAsFactors=FALSE,dec=".",na.strings="?",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
pw$Date <- as.Date(strptime(pw$Date,"%d/%m/%Y"))
pw1 <- subset(pw,as.Date(pw$Date) >= as.Date("2007-02-01") & as.Date(pw$Date) <= as.Date("2007-02-02"))
rm(pw)
pw1$Time <-  strptime(paste(pw1$Date, pw1$Time), "%Y-%m-%d %H:%M:%S")

png("plot1.png",width=480,height=480,antialias="cleartype")
par(mfcol=c(1,1),mar=c(5,4,2,1),oma = c(0, 0, 0, 0))
hist(pw1$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()

