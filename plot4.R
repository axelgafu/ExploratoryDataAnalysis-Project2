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
#' 4. Across the United States, how have emissions from coal combustion-related
#' sources changed from 1999–2008?
coalSCC <- SCC$SCC[ grepl( "coal", SCC$Short.Name ) ]
 
baltimore <- NEI[NEI$SCC %in% coalSCC,]
baltimore$SCCLab <- baltimore$SCC
# Replace numeric labels of sources by actual source names. 
for( scc in unique(baltimore$SCCLab) )
{
    baltimore$SCCLab <- 
        gsub( scc, SCC$Short.Name[SCC$SCC == scc], baltimore$SCCLab )
}


png( "plot4.png" )
ggplot( baltimore, aes( log10( Emissions)) ) +
    geom_histogram(binwidth=1) + facet_grid( SCCLab~year ) +
    labs( title="Baltimore Emissions by SCC") + 
    theme(strip.text.x = element_text(angle=0)) +
    theme(strip.text.y = element_text(angle=0))

dev.off()