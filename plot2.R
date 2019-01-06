# Exploratory Data Analysis
# Course Project 2
# Question 2

# Set working directory
setwd("D:/Oscar/Data Science Specialization/Exploratory Data Analysis/Project 2")

# Read file
# This first line will likely take a few seconds. Please be patient!
NEI <- readRDS("summarySCC_PM25.rds")

#Subset NEI, looking at emissions in Baltimore City (fips=="24510")
NEIbaltimore <- NEI[NEI$fips == "24510", ]

# Calculate total emmission by year using the tapply function
TotalPM <- tapply(NEIbaltimore$Emissions, NEIbaltimore$year, sum)

# Create PNG file using base plotting system
png("plot2.png")
barplot(TotalPM, xlab = "years", ylab = "Total PM2.5 Emission (Tons)", 
        main = "Total PM2.5 Emission in Baltimore City from 1999
        to 2008", ylim = c(0, 3500))
dev.off()
