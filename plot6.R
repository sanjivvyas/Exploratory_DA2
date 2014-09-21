# Name: Sanjiv Vyas
# Class: Exploratory Data Analysis
# Date: 09/21/2014
# ====================================================================================================
# Desc: The overall goal of this assignment is to explore the National Emissions Inventory database 
# and see what it say about fine particulate matter pollution in the United states over the 10-year period 1999-2008. 
# plot6.R addresses this sixth question: 
# 6.Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in 
# Los Angeles County, California (fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?

# Data for this analysis is already downloaded and unzipped in directory - C:/Users/Vyas2/Documents/Coursera/Exploratory_DA/Project2
# following command makes sure that code is pointing to the correct directory for data

 # Load data 
 NEI <- readRDS("summarySCC_PM25.rds") 
 SCC <- readRDS("Source_Classification_Code.rds") 
 

baltimore.emissions <- NEI[(NEI$fips=="24510") & (NEI$type=="ON-ROAD"),] 
baltimore.emissions.aggragate <- aggregate(Emissions ~ year, data=baltimore.emissions, FUN=sum) 



los_angeles.emissions <- NEI[(NEI$fips=="06037") & (NEI$type=="ON-ROAD"),] 
los_angeles.emissions.aggragate <- aggregate(Emissions ~ year, data=los_angeles.emissions, FUN=sum) 


baltimore.emissions.aggragate$County <- "Baltimore City" 
los_angeles.emissions.aggragate$County <- "Los Angeles County" 
all_emissions <- rbind(baltimore.emissions.aggragate, los_angeles.emissions.aggragate) 


library(ggplot2) 
png("plot6.png",width=680, height=680) 
print(ggplot(all_emissions, aes(x=factor(year), y=Emissions, fill=County)) + 
        geom_bar(stat="identity") +  
        facet_grid(County  ~ ., scales="free") + 
        ylab("total emissions (tons)") +  
        xlab("year") + 
        ggtitle(expression("Motor vehicle emission variation in\nBaltimore and Los Angeles")))
dev.off()  
