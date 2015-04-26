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
#' 2. Have total emissions from PM2.5 decreased in the Baltimore City, Maryland
#' (fips == "24510") from 1999 to 2008? Use the base plotting system to make a 
#' plot answering this question.
png( "plot2.png" )
meryland <- NEI[NEI$fips=="24510",]
boxplot( log10( meryland$Emissions ) ~ meryland$year, main="Emissions per Year in Baltimore City, Maryland", xlab="Year", ylab="log10( Emissions )", notch=TRUE )
dev.off()