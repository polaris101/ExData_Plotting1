plot1<-function(){
    data<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE)
    subdata<-subset(data, Date=="1/2/2007" | Date=="2/2/2007")
    subdata$Time<-strptime(paste(subdata$Date,subdata$Time),format="%d/%m/%Y %H:%M:%S", tz="")
    subdata$Date<-as.Date(subdata$Date,"%d/%m/%Y")
    par(mar=c(5.1,4.1,4.1,2.1))
    hist(subdata$Global_active_power, main="Global Active Power", col="red", xlab="Global Active Power(kilowatts)", ylab="Frequency")
    dev.copy(png, file="plot1.png", width=480, height=480)
    dev.off()
}