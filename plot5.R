# Exploratory Data Analysis
# Course Project 2
# Question 5

# Set working directory
setwd("D:/Oscar/Data Science Specialization/Exploratory Data Analysis/Project 2")

# Read file
# This first line will likely take a few seconds. Please be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Subset NEI, looking at emissions in Baltimore City (fips=="24510")
NEIbaltimore <- NEI[NEI$fips == "24510", ]

# Merge the two FILES: NEIbaltimore and SCC
mergedata <- merge(NEIbaltimore, SCC, by = "SCC")

# Filter out non vehicle sources
vehiclematch <- grep("vehicle", mergedata$Short.Name, ignore.case = TRUE)
vehicle <- mergedata[vehiclematch, ]

# Create PNG file
# No plottting system especified, using ggplot2 plotting system
# Load ggplot2 package
library(ggplot2)

png("plot5.png")
g <- ggplot(vehicle, aes(factor(year), Emissions))
g + geom_col() + labs(x = "years", y = "Total PM2.5 Emission (Tons)", title = "Total PM2.5 vehicles Emission in Baltimore City from 1999 to 2008")
dev.off()