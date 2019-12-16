##Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips=="24510") from 1999 to 2008?
Maryland<-subset(NEI,NEI$fips=="24510")
TotalMD<-aggregate(Maryland$Emissions,by=list(Maryland$year),FUN=sum)
names(TotalMD)<-c("Year","TotalEmission")
plot(TotalMD$Year,TotalMD$TotalEmission,type="l", lwd=3, xlab="Year", ylab="Total Emission",main="Total Emission by Year in MD" )
