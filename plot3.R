# Name: Sanjiv Vyas
# Class: Exploratory Data Analysis
# Date: 09/21/2014
# ====================================================================================================
# Desc: The overall goal of this assignment is to explore the National Emissions Inventory database 
# and see what it say about fine particulate matter pollution in the United states over the 10-year period 1999-2008. 
# plot3.R addresses this third question: 
# 3.Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) 
# variable, which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City?
# Which have seen increases in emissions from 1999-2008? Use the ggplot2 plotting system to make a plot 
# answer this question.

# Data for this analysis is already downloaded and unzipped in directory - C:/Users/Vyas2/Documents/Coursera/Exploratory_DA/Project2
# following command makes sure that code is pointing to the correct directory for data

setwd("C:/Users/Vyas2/Documents/Coursera/Exploratory_DA/Project2") 
# Load data 
NEI <- readRDS("summarySCC_PM25.rds") 
SCC <- readRDS("Source_Classification_Code.rds") 
 
Baltimore.emissions <- NEI[NEI$fips=="24510",] 

Baltimore.emissions.aggr <- aggregate(Emissions ~ year + type, data=Baltimore.emissions, FUN=sum) 

library(ggplot2)

png("plot3.png", height=680, width=680)

print(ggplot(Baltimore.emissions.aggr, aes(x=factor(year), y=Emissions, fill=type),size = 8) +
  geom_bar(stat="identity", color = 'red', size = 2) +
  facet_grid(. ~ type) +
  xlab("--- > years --- >") + 
  ylab(expression("--- > total PM"[2.5]*" emission --->")) +
  ggtitle(expression("PM"[2.5]*paste(" emissions in Baltimore ", "City by various source types", sep=""))), color ='blue', size = 5)

dev.off()

