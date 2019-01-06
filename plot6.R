# Exploratory Data Analysis
# Course Project 2
# Question 6

# Set working directory
setwd("D:/Oscar/Data Science Specialization/Exploratory Data Analysis/Project 2")

# Read file
# This first line will likely take a few seconds. Please be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Subset NEI: Baltimore City (fips=="24510") and Los Angeles County (fips=="06037")
NEIbalcal <- NEI[NEI$fips == "24510" | NEI$fips == "06037", ]

# Merge the two files: NEIbalcal and SCC
mergedata <- merge(NEIbalcal, SCC, by = "SCC")

# Filter out non vehicle sources
vehiclematch <- grep("vehicle", mergedata$Short.Name, ignore.case = TRUE)
vehicle <- mergedata[vehiclematch, ]

# Changing city number code by city name
vehicle$fips[vehicle$fips == "24510"] <- "Baltimore City"
vehicle$fips[vehicle$fips == "06037"] <- "Los Angeles County"

# Create PNG file
# No plottting system especified, using ggplot2 plotting system
# Load ggplot2 package
library(ggplot2)

png("plot6.png")
g <- ggplot(vehicle, aes(factor(year), Emissions))
g + geom_col(aes(fill = fips), show.legend = FALSE) + facet_grid(.~fips) + labs(x = "years", y = "Total PM2.5 Emission (Tons)", title = "Total PM2.5 vehicles Emission in Baltimore and Los Angeles from 1999 to 2008")
dev.off()