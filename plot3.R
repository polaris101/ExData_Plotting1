plot3<-function(){
    data<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE)
    subdata<-subset(data, Date=="1/2/2007" | Date=="2/2/2007")
    subdata$Time<-strptime(paste(subdata$Date,subdata$Time),format="%d/%m/%Y %H:%M:%S", tz="")
    subdata$Date<-as.Date(subdata$Date,"%d/%m/%Y")
    par(mar=c(5.1,4.1,4.1,2.1))
    Sys.setlocale("LC_TIME","English")
    plot(subdata$Time,subdata$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
    points(subdata$Time,subdata$Sub_metering_2,type="l",col="red")
    points(subdata$Time,subdata$Sub_metering_3,type="l",col="blue")
    legend("topright", lwd=2, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))    
    dev.copy(png, file="plot3.png")
    dev.off()
}
