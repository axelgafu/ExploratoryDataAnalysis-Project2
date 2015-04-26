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
#' 6. Compare emissions from motor vehicle sources in Baltimore City with 
#' emissions from motor vehicle sources in Los Angeles County, California 
#' (fips == "06037"). Which city has seen greater changes over time in motor 
#' vehicle emissions?

#' Select motor vehicle emissions
motorVSCC <- SCC$SCC[ SCC$Data.Category=="Onroad" | 
                          grepl( "motorcycle", SCC$Short.Name, ignore.case=TRUE ) ]

#' Select Baltimore City and Los Angeles
states <- NEI[NEI$SCC %in% motorVSCC & (NEI$fips=="24510"|NEI$fips=="06037"),]

# Replace numeric labels of sources by actual source names. 
states$fips[states$fips=="24510"] <- "Baltimore"
states$fips[states$fips=="06037"] <- "Los Angeles"

png( "plot6.png" )
ggplot( states, aes(factor(year), log10(Emissions)) ) +
    geom_jitter(color="grey", alpha=0.5) + 
    geom_boxplot( notch=TRUE, alpha=0.5 ) + facet_grid( .~fips ) +
    labs( x="Year" ) +
    labs( title="Motor Vehicle Emissions,\nBaltimore vs Los Angeles")

dev.off()
