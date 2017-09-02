
##read lines and get how much lines to read
Lines<-readLines('./testdir/household_power_consumption.txt')
number1<-grep('1/2/2007',Lines)[1]
number2<-grep('3/2/2007',Lines)[1]
s_number<-number[1]-1
r_number<-number2-number1
household<-read.table('./testdir/household_power_consumption.txt',sep=';',skip=s_number,nrow=r_number,na.strings = '?')
names(household)<-names(read.table('./testdir/household_power_consumption.txt',sep=';',header=TRUE,nrow=1))

##plot the hisotgram
png(filename = 'plot1.png')
with(household,hist(Global_active_power,col = 'red',main='Global Active Power',xlab='Global Active Power(kilowatts)', ylab='Frequency'))
dev.off()