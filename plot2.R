plot2<-function(){
    data<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE)
    subdata<-subset(data, Date=="1/2/2007" | Date=="2/2/2007")
    subdata$Time<-strptime(paste(subdata$Date,subdata$Time),format="%d/%m/%Y %H:%M:%S", tz="")
    subdata$Date<-as.Date(subdata$Date,"%d/%m/%Y")
    par(mar=c(5.1,4.1,4.1,2.1))
    Sys.setlocale("LC_TIME","English")
    plot(subdata$Time,subdata$Global_active_power,type="l",xlab="",ylab="Global Active Power(kilowatts)")    
    dev.copy(png, file="plot2.png")
    dev.off()
}
