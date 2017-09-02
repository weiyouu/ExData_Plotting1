library(lubridate)
library(data.table)

##read lines and get how much lines to read
Lines<-readLines('./testdir/household_power_consumption.txt')
number1<-grep('1/2/2007',Lines)[1]
number2<-grep('3/2/2007',Lines)[1]
s_number<-number[1]-1
r_number<-number2-number1
household<-read.table('./testdir/household_power_consumption.txt',sep=';',skip=s_number,nrow=r_number,na.strings = '?')
names(household)<-names(read.table('./testdir/household_power_consumption.txt',sep=';',header=TRUE,nrow=1))
household<-as.data.table(household)

##combine date and time to make a new colunm with class POSIXct
household[,dmyhms:=paste(Date,Time)]
household[,dmyhms:=dmy_hms(dmyhms)]

##draw the plot
png(filename = 'plot3.png')
with(household,plot(dmyhms,y=Sub_metering_1,type='l',ylab='Sub Metering'))
lines(household[,dmyhms],household[,Sub_metering_2],type='l',col='red')
lines(household[,dmyhms],household[,Sub_metering_3],type='l',col='blue')
legend('topright',col=c('black','red','blue'),pch='-',legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))
dev.off()
