# Name: Sanjiv Vyas
# Class: Exploratory Data Analysis
# Date: 09/21/2014
# ====================================================================================================
# Desc: The overall goal of this assignment is to explore the National Emissions Inventory database 
# and see what it say about fine particulate matter pollution in the United states over the 10-year period 1999-2008. 
# plot2.R addresses this second question: 
# 2.Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") 
# from 1999 to 2008? Use the base plotting system to make a plot answering this question.

# Data for this analysis is already downloaded and unzipped in directory - C:/Users/Vyas2/Documents/Coursera/Exploratory_DA/Project2
# following command makes sure that code is pointing to the correct directory for data

setwd("C:/Users/Vyas2/Documents/Coursera/Exploratory_DA/Project2") 
NEI <- readRDS("summarySCC_PM25.rds") 
SCC <- readRDS("Source_Classification_Code.rds") 
 
Baltimore.emissions <- NEI[NEI$fips=="24510",] 
Baltimore.emissions.by.year <- aggregate(Emissions ~ year, Baltimore.emissions, sum) 
 
png('plot2.png',width=680, height=680) 
 barplot(height=Baltimore.emissions.by.year$Emissions, 
       names.arg=Baltimore.emissions.by.year$year, 
       xlab="--- >  years --- >", ylab=expression('--- > total PM'[2.5]*' emission --- >'), main=expression('Total PM'[2.5]*' emissions in Baltimore City, '* 'Maryland at various years'),col="blue") 
 dev.off() 
