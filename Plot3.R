#Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable,
#which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
#Which have seen increases in emissions from 1999–2008?
library(ggplot2)
Baltimore<-subset(NEI,NEI$fips=="24510")
MDTypeYear<-aggregate(Baltimore$Emissions,by=list(Baltimore$year,Baltimore$type),FUN=sum)
names(MDTypeYear)<-c("Year","Type","TotalEmission")
qplot(Year,TotalEmission,data=MDTypeYear,color=Type,geom="line", main="Emission by Type and Year")
