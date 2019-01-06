# Exploratory Data Analysis
# Course Project 2
# Question 4

# Set working directory
setwd("D:/Oscar/Data Science Specialization/Exploratory Data Analysis/Project 2")

# Read files
# This first line will likely take a few seconds. Please be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Eliminate unwanted columns from files
NEI <- NEI[ , c(2, 4, 6)] # Keeping SCC, Emissions and year
SCC <- SCC[ , c(1, 3)] # Keeping SCC and Short.Name

# Merge the two files: NEI and SCC
NEISCC <- merge(NEI, SCC, by = "SCC")

# Filter coal sources
coalmatch <- grep("coal", NEISCC$Short.Name, ignore.case = TRUE)
coal <- NEISCC[coalmatch, ]

# Calculate total emmission by year using the tapply function
TotalPM <- tapply(coal$Emissions, coal$year, sum)

# Create PNG file
# No plottting system especified so using base plotting system
png("plot4.png")
barplot(TotalPM, xlab = "years", ylab = "Total PM2.5 Emission (Tons)", 
        main = "Total PM2.5 Emission from coal combustion in the
        USA from 1999 to 2008")
dev.off()