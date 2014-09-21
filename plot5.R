# Name: Sanjiv Vyas
# Class: Exploratory Data Analysis
# Date: 09/21/2014
# ====================================================================================================
# Desc: The overall goal of this assignment is to explore the National Emissions Inventory database 
# and see what it say about fine particulate matter pollution in the United states over the 10-year period 1999-2008. 
# plot5.R addresses this fifth question: 
# 5.How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City? 

# Data for this analysis is already downloaded and unzipped in directory - C:/Users/Vyas2/Documents/Coursera/Exploratory_DA/Project2
# following command makes sure that code is pointing to the correct directory for data

 # Load data 
 NEI <- readRDS("summarySCC_PM25.rds") 
 SCC <- readRDS("Source_Classification_Code.rds") 

 Baltimore.emissions <- NEI[(NEI$fips=="24510") & (NEI$type=="ON-ROAD"),] 
 Baltimore.emissions.aggr <- aggregate(Emissions ~ year, data=Baltimore.emissions, FUN=sum) 
 
 library(ggplot2) 
 png("plot5.png",width=680, height=680) 
 print(ggplot(Baltimore.emissions.aggr, aes(x=factor(year), y=Emissions)) + 
   geom_bar(stat="identity", color = 'blue', size = 2) + 
   xlab("--- > year ---> ") + 
   ylab(expression("--- > total PM"[2.5]*" emissions --- >")) + 
   ggtitle("Emissions from motor vehicle sources in Baltimore City"))
 dev.off() 

