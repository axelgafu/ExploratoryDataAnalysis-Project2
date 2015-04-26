# ExploratoryDataAnalysis-Project2
Second project of Exploratory Data Analysis course.

## Data

The data for this assignment are available from the course web site as a single zip file:

Data for Peer Assessment [29Mb]
The zip file contains two files:

PM2.5 Emissions Data (summarySCC_PM25.rds): This file contains a data frame with all of the PM2.5 emissions data for 1999, 2002, 2005, and 2008. For each year, the table contains number of tons of PM2.5 emitted from a specific type of source for the entire year. Here are the first few rows.

|Field|Description|
|-----|-----------|
|fips| A five-digit number (represented as a string) indicating the U.S. county|
|SCC| The name of the source as indicated by a digit string (see source code classification table)|
|Pollutant| A string indicating the pollutant|
|Emissions| Amount of PM2.5 emitted, in tons|
|type| The type of source (point, non-point, on-road, or non-road)|
|year| The year of emissions recorded|

## Results
The overall goal of this exercise is to explore the National Emissions Inventory database and see what it say about fine particulate matter pollution in the United states over the 10-year period 1999–2008.

1. Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.
![](plot1.png?raw=true)

See R code in [plot1.R](https://github.com/axelgafu/ExploratoryDataAnalysis-Project2/blob/master/plot1.png)


2. Have total emissions from PM2.5 decreased in the **Baltimore City**, Maryland (fips == "24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question.
![](plot2.png?raw=true)

See R code in [plot2.R](https://github.com/axelgafu/ExploratoryDataAnalysis-Project2/blob/master/plot2.png)


3. Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999–2008 for **Baltimore City**? Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.
![](plot3.png?raw=true)

See R code in [plot3.R](https://github.com/axelgafu/ExploratoryDataAnalysis-Project2/blob/master/plot3.png)


4. Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?
![](plot4.png?raw=true)

See R code in [plot4.R](https://github.com/axelgafu/ExploratoryDataAnalysis-Project2/blob/master/plot4.png)


5. How have emissions from motor vehicle sources changed from 1999–2008 in **Baltimore City**?
![](plot5.png?raw=true)

See R code in [plot5.R](https://github.com/axelgafu/ExploratoryDataAnalysis-Project2/blob/master/plot5.png)


6. Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in **Los Angeles** County, California (fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?
![](plot6.png?raw=true)

See R code in [plot6.R](https://github.com/axelgafu/ExploratoryDataAnalysis-Project2/blob/master/plot6.png)
