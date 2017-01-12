#!bin/data
echo "Script0rs - Inge/David"
echo "12 January 2017"
echo "Calculate LandSat NDVI"
clear
cp LE71700552001036SGS00_SR_Gewata_INT1U.tif input.tif

echo "calculate ndvi"
gdal_calc.py -A $fn --A_band=4 -B input.tif --B_band=3 --outfile=ndvi.tif --calc="(A.astype(float)-B)/(A.astype(float)+B)" --type='Float32'
echo "resampling the NDVI tif file to pixels of 60m"
gdal_translate -tr 60 60 ndvi.tif resampledndvi.tif
echo "reprojecting the resampled file to Lat/Long WGS84"
gdalwarp -t_srs EPSG:4326 resampledndvi.tif reprojectedndvi.tif
echo "look at some histogram statistics"
gdalinfo -hist -stats ndvi.tif
rm -f resampledndvi.tif



