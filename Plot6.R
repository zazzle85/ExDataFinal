#Compare emissions from motor vehicle sources in Baltimore City with emissions 
#from motor vehicle sources in Los Angeles County, California fips=="06037".
#Which city has seen greater changes over time in motor vehicle emissions?

library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

subs<-subset(NEI,NEI$fips=="24510"|NEI$fips=="06037")
subs$fips[subs$fips=="24510"]<-"Baltimore"
subs$fips[subs$fips=="06037"]<-"LA"

Cars<-SCC[grepl("On-Road",SCC$EI.Sector),]
Merged<-merge(subs,Cars,by="SCC")

YR<-aggregate(Merged$Emissions,by=list(Merged$year,Merged$fips),FUN=sum)
names(YR)<-c("Year","City","Emissions")
qplot(Year,Emissions,color=City,data=YR,geom="line", main="Vehicle Emission by City and Year")+theme(legend.position = "bottom")

