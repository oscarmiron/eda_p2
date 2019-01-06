# Exploratory Data Analysis
# Course Project 2
# Question 3

# Set working directory
setwd("D:/Oscar/Data Science Specialization/Exploratory Data Analysis/Project 2")

# Read file
# This first line will likely take a few seconds. Please be patient!
NEI <- readRDS("summarySCC_PM25.rds")

#Subset NEI, looking at emissions in Baltimore City (fips=="24510")
NEIbaltimore <- NEI[NEI$fips == "24510", ]

# Create PNG file using ggplot2 plotting system.
# Load ggplot2 package
library(ggplot2)

png("plot3.png")

g <- ggplot(NEIbaltimore, aes(factor(year), Emissions))
g + geom_col(aes(fill = type), show.legend = FALSE) + facet_grid(.~type) + labs(x = "years", y = "Total PM2.5 Emission (Tons)", title = "Total PM2.5 Emission in Baltimore City from 1999 to 2008 by source type")

dev.off()