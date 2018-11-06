library(ggmap)
library(DatabaseConnector)
library(RODBC)
devtools::install_github("dkahle/ggmap")

## Put the information of SQL server and database
connectionDetails <- DatabaseConnector::createConnectionDetails(
                                                dbms="sql server",
                                                server="$$$$",
                                                user="$$$$",
                                                password="$$$$",
                                                schema="$$$$")

conn <- DatabaseConnector::connect(connectionDetails)

## Put the information of your Google Geocoding API
ggmap::register_google(key = '$$$$', account_type = "standard", client = NA, signature = NA, day_limit = 2500, second_limit = 2500)
## Put name of the nation
ggmap::geocode(location = '$$$$', source='google')

## Get Location table of CDM version_5 from SQL server
df_location <- DatabaseConnector::dbReadTable(conn, name = "$$$$.LOCATION")

# Make longitude and latitude data.frame
for (i in 1:nrow(df_location)){
        lat_lon <- data.frame(lat=numeric(), lon=numeric())
        na_df <- data.frame(lat=NA, lon=NA)
        
        location_code <- paste0(df_location$address_1[i], df_location$address_2[i]) 
        
        if(!is.null(location_code)){
                lat_lon <- rbind(lat_lon, ggmap::geocode(location_code, source="google"))
        }       
        else{
                lat_lon <- rbind(lat_lon, na_df)
        }
}

# Change column order
colnames(lat_lon) <- c("longitude", "latitude")
colorder <- c("latitude", "longitude")
lat_lon <- lat_lon[, colorder]

# Combine with existing Location table
LOCATION_v6 <- cbind(df_location, lat_lon)

#Insert table
DatabaseConnector::insertTable(connection = conn,
                               tableName = "dbo.LOCATION_v6",
                               data = LOCATION_v6, 
                               dropTableIfExists = FALSE, 
                               createTable = TRUE,
                               tempTable = FALSE,
                               useMppBulkLoad = FALSE)
## Disconnect 
disconnect(conn)
