plot4<-function(){
    data<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE)
    subdata<-subset(data, Date=="1/2/2007" | Date=="2/2/2007")
    subdata$Time<-strptime(paste(subdata$Date,subdata$Time),format="%d/%m/%Y %H:%M:%S", tz="")
    subdata$Date<-as.Date(subdata$Date,"%d/%m/%Y")
    par(mar=c(5.1,4.1,4.1,2.1))
    Sys.setlocale("LC_TIME","English")
    par(mfcol=c(2,2))
    
    ## first plot
    plot(subdata$Time,subdata$Global_active_power,type="l",xlab="",ylab="Global Active Power")
    
    ## second plot
    plot(subdata$Time,subdata$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
    points(subdata$Time,subdata$Sub_metering_2,type="l",col="red")
    points(subdata$Time,subdata$Sub_metering_3,type="l",col="blue")
    legend("topright", lwd=2, col=c("black","red","blue"), cex=0.67, bty="n", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))    
    
    ## third plot
    plot(subdata$Time, subdata$Voltage, type="l", xlab="datetime", ylab="Voltage")
    
    ## fourth plot
    plot(subdata$Time, subdata$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power", yaxt="n")
    axis(2,at=c(0.0,0.1,0.2,0.3,0.4,0.5),labels=c("0.0","0.1","0.2","0.3","0.4","0.5"))

    dev.copy(png, file="plot4.png", width=480, height=480)
    dev.off()
}