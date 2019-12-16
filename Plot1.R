##Have total emissions from PM2.5 decreased in the United States from 1999 to 2008?
##Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.
library(dplyr)
Total<-aggregate(NEI$Emissions,by=list(NEI$year),FUN=sum)
names(Total)<-c("Year","TotalEmission")
plot(Total$Year,Total$TotalEmission,type="l", lwd=3, xlab="Year", ylab="Total Emission",main="Total Emission by Year" )
