#!/bin/data
dir='data'
cd ../$dir
clear
cp LE71700552001036SGS00_SR_Gewata_INT1U.tif input.tif
gdal_calc.py -A input.tif --A_band=4 -B input.tif --B_band=3  --outfile=NDVI.tif  --calc="(A.astype(float)-B)/(A.astype(float)+B)" --type='Float32'
rm -f input.tif
gdal_translate -tr 60 60 NDVI.tif input2.tif
output='NDVIreprojected.tif'
gdalwarp -t_srs EPSG:4326 input2.tif NDVIreprojected.tif  
rm -f input2.tif
echo "/$dir/$output has been created"