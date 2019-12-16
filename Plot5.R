#How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?
library(ggplot2)


NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

Baltimore<-subset(NEI,NEI$fips=="24510")
Cars<-SCC[grepl("On-Road",SCC$EI.Sector),]

Merged<-merge(Baltimore,Cars,by="SCC")

YT<-aggregate(Merged$Emissions,by=list(Merged$year),FUN=sum)
names(YT)<-c("Year","Emissions")
qplot(Year,Emissions,data=YT,geom="line", main="Emission by Year in Baltimore")
