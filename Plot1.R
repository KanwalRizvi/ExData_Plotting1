
## Getting the data ##

#link for data
url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

#dowload file from link
if(!file.exists("zippedData.zip")){download.file(url,destfile="./zippedData.zip")}

#unzip zip file
if(!file.exists("dataFile")){dataFile<-unzip(zipfile = "zippedData.zip")}

#recording the date when data was download
if(!exists("dateDownloaded")){dateDownloaded=date()}

#reading the data - fread - fastest way to read large data into memeory
allData<-fread(input = dataFile,stringsAsFactors = '?',colClasses = )

#converting the date to date class
allData$Date<-as.Date(allData$Date,format = '%d/%m/%Y')
 

data<-allData[allData$Date=='2007-02-01'| allData$Date=='2007-02-02']
rm(allData)
hist(x = as.numeric(data$Global_active_power),xlab = 'Global Active Power (killowatts)',col = 'red',ylab = 'Frequency',main = 'Global Active Power')
        
       
library(datasets)

#png(filename = 'plot1.png',width = 480, height = 480)
dev.copy(png,file='plot1.png',width = 480, height = 480)
dev.off()
