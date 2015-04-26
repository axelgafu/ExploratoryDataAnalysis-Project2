# Get data
wdfiles <- list.files(".")
if( !"data.zip" %in% wdfiles )
{
    print( "Downloading files." );
    download.file( "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip", "data.zip", method="curl" )
}

if( !all( c("Source_Classification_Code.rds", "summarySCC_PM25.rds") %in% wdfiles ) )
{
    print( "Extracting files." );
    unzip( "data.zip", overwrite=TRUE )
}

# Read data
NEI <- readRDS( "summarySCC_PM25.rds" )
SCC <- readRDS( "Source_Classification_Code.rds" )

#' Process data
#' 1. Have total emissions from PM2.5 decreased in the United States from 1999 
#' to 2008? Using the base plotting system, make a plot showing the total PM2.5 
#' emission from all sources for each of the years 1999, 2002, 2005, and 2008.
#' 
fYear <- factor( NEI$year )
#plot( NEI$Emissions ~ fYear )
#plot( NEI$year, NEI$Emissions, main="Emissions per Year", xlab="Year", ylab="Emissions", ylim=c(0, 2e+05) )
#boxplot( log10( NEI$Emissions ) ~ NEI$year, main="Emissions per Year", xlab="Year", 
#ylab="log10( Emissions )", notch=TRUE )

png( "plot1.png" )
#boxplot( log10( NEI$Emissions ) ~ NEI$year, main="Emissions per Year", xlab="Year", ylab="log10( Emissions )", notch=TRUE )
samp <- sample( NEI$Emissions, length(NEI$Emissions)/10 )
idx <- NEI$Emissions %in% samp
boxplot( log10( NEI$Emissions[idx] ) ~ NEI$year[idx], main="Emissions per Year", xlab="Year", ylab="log10( Emissions )", notch=TRUE )
dev.off()
