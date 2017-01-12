#!bin/data
echo "Script0rs"
echo "12 January 2017"
echo "Calculate LandSat NDVI"
cd /home/ubuntu/data/
fn=afbeelding.tif
echo "The input file: $fn"
outfn="ndvi.tif"
echo "The output file: $outfn"
echo "calculate ndvi"
gdal_calc.py -A $fn --A_band=4 -B $fn --B_band=3 --outfile=$outfn --calc="(A.astype(float)-B)/(A.astype(float)+B)" --type='Float32'
echo "resampling the NDVI tif file to pixels of 60m"
fntemp="resampledndvi.tif"
gdal_translate -tr 60 60 $outfn $fntemp
echo "reprojecting the resampled file to Lat/Long WGS84"
fnout="reprojectedndvi.tif"
gdalwarp -t_srs EPSG:4326 $fntemp $fnout
echo "look at some histogram statistics"
gdalinfo -hist -stats $fnout
rm -f $fntemp



