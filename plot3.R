if(!exists('data')){
        #link for data
        url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        
        #dowload file from link
        download.file(url,destfile="./zippedData.zip")
        
        #unzip zip file
        dataFile<-unzip(zipfile = "zippedData.zip")
        
        #recording the date when data was download
        dateDownloaded=date()
        
        #reading the data - fread - fastest way to read large data into memeory
        allData<-fread(input = dataFile,stringsAsFactors = '?',colClasses = )
        
        #converting the date to date class
        allData$Date<-as.Date(allData$Date,format = '%d/%m/%Y')
        
        #subsetting data         
        data<-allData[allData$Date=='2007-02-01'| allData$Date=='2007-02-02']
        
        #removing unwanted data
        rm(allData)
}
windows(width=480, height=480)
plot(as.numeric(data$Sub_metering_1),type = "l",ylab = 'Energy sub metering',col = 'black',frame.plot = TRUE,axes = FALSE,xlab = ' ')
lines(as.numeric(data$Sub_metering_2),col = 'red')
lines(as.numeric(data$Sub_metering_3),col = 'blue')
axis(side = 1,labels = c('Thu','Fri','Sat'),at = c(0,1440,2880))
axis(side =2)
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c('black','red','blue'),lty = c(1,1,1))

library(datasets)

#png(filename = 'plot1.png',width = 480, height = 480)
dev.copy(png,file='plot3.png',width=480,height=480)
dev.off()
