#!/bin/bash

#Script0rs - Inge/David 12 January 2017
#Calculate LandSat NDVI#
clear
#Create directory
cd data
#Copy data
cp LE71700552001036SGS00_SR_Gewata_INT1U.tif input.tif
#Create NDVI map
gdal_calc.py -A input.tif --A_band=4 -B input.tif --B_band=3 --outfile=ndvi.tif --calc="(A.astype(float)-B)/(A.astype(float)+B)" --type='Float32'
#Resample to 60m by 60m pixels
gdal_translate -tr 60 60 ndvi.tif resampledndvi.tif 
#Reproject to WGS 84 with lon and lat
gdalwarp -t_srs EPSG:4326 resampledndvi.tif reprojectedndvi.tif
#Remove temporary files
rm -f input.tif
rm -f ndvi.tif
rm -f resampledndvi.tif



