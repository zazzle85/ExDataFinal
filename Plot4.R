#Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?
library(ggplot2)


NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##Create a subset
Coal<-SCC[grepl("Coal",SCC$EI.Sector),]
CoalMerged<-merge(Coal,NEI, by="SCC")

#Over years
OverYear<-aggregate(CoalMerged$Emissions,by=list(CoalMerged$year),FUN=sum)
names(OverYear)<-c("Year","TotalEmission")
qplot(Year,TotalEmission,data=OverYear,geom="line", main="Emission by Year")

#over type and years
YT<-aggregate(CoalMerged$Emissions,by=list(CoalMerged$year,CoalMerged$type),FUN=sum)
names(YT)<-c("Year","type","Emissions")
qplot(Year,Emissions,color=type,data=YT,geom="line", main="Emission by Type and Year")
