# Name: Sanjiv Vyas
# Class: Exploratory Data Analysis
# Date: 09/21/2014
# ====================================================================================================
# Desc: The overall goal of this assignment is to explore the National Emissions Inventory database 
# and see what it say about fine particulate matter pollution in the United states over the 10-year period 1999-2008. 
# plot1.R addresses this first question: 
# 1.Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years
# 1999, 2002, 2005, and 2008.

# Data for this analysis is already downloaded and unzipped in directory - C:/Users/Vyas2/Documents/Coursera/Exploratory_DA/Project2
# following command makes sure that code is pointing to the correct directory for data

setwd("C:/Users/Vyas2/Documents/Coursera/Exploratory_DA/Project2") 
NEI <- readRDS("summarySCC_PM25.rds") 
SCC <- readRDS("Source_Classification_Code.rds") 
 
total.emissions2_5 <- aggregate(Emissions ~ year, NEI, sum)
png("plot1.png", width=680, height=680) 
  
 barplot(height=total.emissions2_5$Emissions, names.arg=total.emissions2_5$year, xlab="--- >  years --- >", ylab=expression('--- > total PM'[2]*' emission --- >'), 
         main=expression('Total PM'[2.5]*' emissions at various years'),col="red" ) 
dev.off() 
