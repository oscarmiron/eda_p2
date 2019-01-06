# Exploratory Data Analysis
# Course Project 2
# Question 1

# Set working directory
setwd("D:/Oscar/Data Science Specialization/Exploratory Data Analysis/Project 2")

# Read file
# This first line will likely take a few seconds. Please be patient!
NEI <- readRDS("summarySCC_PM25.rds")

# Calculate total emmission by year using the tapply function
TotalPM <- tapply(NEI$Emissions, NEI$year, sum)

# Create PNG file using base plotting system
png("plot1.png")
barplot(TotalPM, xlab = "years", ylab = "Total PM2.5 Emission (Tons)", 
        main = "Total PM2.5 Emission in the USA from 1999 to
        2008", ylim = c(0, 8000000))
dev.off()
