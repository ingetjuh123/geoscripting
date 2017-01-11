# Name: Script0rs - Inge van der Mond, David Swinkels
# Date: 9 January 2017

# Import packages
library(raster)

# Define the function
createMap <- function(pcountry, pcountry2,pcountry3,pcountry4,plevel){
    #Create Data Directory
  datdir <- 'data'
  dir.create(datdir, showWarnings = FALSE)
    #Get administrative boundaries
  adm <- raster::getData("GADM", country = pcountry, level = plevel, path = datdir)
  adm2 <- raster::getData("GADM", country = pcountry2, level = 0, path = datdir)
  adm3 <- raster::getData("GADM", country = pcountry3, level = 0, path = datdir)
  adm4 <- raster::getData("GADM", country = pcountry4, level = 0, path = datdir)
    #Create Maps
  plot(adm, bg ="#08519c", axes = T)
  plot(adm, col= "#31a354", add = T)
  plot(adm2, col= "grey", add = T)
  plot(adm3, col= "grey", add = T)
  plot(adm4, col= "grey", add = T)
    #Create Labels
  input_adm <- parse(text=paste0("adm$NAME_", toString(plevel)))
  invisible(text(getSpPPolygonsLabptSlots(adm),labels=as.character(eval(input_adm)), cex=0.6, col = "white", font = 2))
    #Add Layout
  mtext(side = 3, line = 1, paste("Country:", adm$NAME_0[1]), cex = 2)
  mtext(side = 1, "Longitude", line = 2.5, cex=1.1)
  mtext(side = 2, "Latitude", line = 2.5, cex=1.1)
  mtext(side = 4, "Coordinate System: WGS 1984\n Data Source: GADM.org", line = 0.8, cex = 0.7, col = "grey20")
    #Add Legend
  legendtext <- c(toString(adm$NAME_0[1]), "Other Countries")
  legend("bottomright", legendtext,fill = c("#31a354","grey"), cex=1)
  }

# An example based on that function
createMap("NLD","BEL","FRA","DEU", 1)


