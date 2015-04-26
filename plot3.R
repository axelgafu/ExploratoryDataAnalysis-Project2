require(ggplot2)

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
#' 3. Of the four types of sources indicated by the type (point, nonpoint, 
#' onroad, nonroad) variable, which of these four sources have seen decreases in
#' emissions from 1999–2008 for Baltimore City? Which have seen increases in 
#' emissions from 1999–2008? Use the ggplot2 plotting system to make a plot 
#' answer this question.
png( "plot3.png" )
baltimore <- NEI[NEI$fips=="24510",]
ggplot( baltimore, aes( factor(year), log10( Emissions)) ) +
  geom_boxplot( notch=TRUE ) + facet_grid( .~type ) +
  labs( x="Year", title="Baltimore Emissions by Type")
dev.off()