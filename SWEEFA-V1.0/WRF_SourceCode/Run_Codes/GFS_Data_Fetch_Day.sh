#!/bin/bash

clear


banner "WRF GFS Data"
echo ""
echo ""
echo ""
echo ""

echo "Before starting check that you have DATA Directory in Build_WRF Directory"
echo ""
echo ""
echo "For real-data cases, the WRF model requires up-to-date meteorological information for both an initial condition and also for lateral boundary conditions. This meteorological data is traditionally a Grib file that is provided by a previously run external model or analysis. For a semi-operational set-up, the meteorological data is usually sourced from a global model, which permits locating the WRF model's domains anywhere on the globe. "
echo ""
echo ""
echo "The National Centers for Environmental Prediction (NCEP) run the Global Forecast System (GFS) model four times daily (initializations valid for 0000, 0600, 1200, and 1800 UTC). This is a global, isobaric, 0.5 degree latitude/longitude, forecast data set that is freely available, and is usually accessible +4h after the initialization time period.
"
echo "A single data file needs to be acquired for each requested time period. For example, if we would like hours 0, 6, and 12 of a forecast that is initialized 2014 Jan 31 at 0000 UTC, we need the following times:"
echo "2014013100 – 0 h"
echo "2014013106 – 6 h"
echo "2014013112 – 12 h"
echo ""
echo ""
echo "These translate to the following file names to access:
"
echo "gfs.2014013100/gfs.t00z.pgrb2.0p50.f000"
echo "gfs.2014013100/gfs.t00z.pgrb2.0p50.f006"
echo "gfs.2014013100/gfs.t00z.pgrb2.0p50.f012"
echo ""
echo ""


echo -e "Do you fullfill above conditions and understand the procedure ? [y/n] : \c"
read Ans
if [ $Ans = "Y" -o $Ans = "y" ]

then

    echo "Let us continue !!"

else

    exit 0
    
fi 

echo -e "Enter your User Folder Name  : \c"
read Unam

cd /home/$Unam/Build_WRF/DATA

echo -e "Enter Initialization Date and Time (YYYYMMDDfh) : \c"
read InitDateTime

File1=1

while [ $File1 -eq 1 ]

do

	curl -s --disable-epsv  -u anonymous:USER_ID@INSTITUTION -o GFS_00h ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/gfs.$InitDateTime/gfs.t00z.pgrb2.0p50.f000

	if [ $? -eq 0 ]

	then

    		File1=2
	
	else

    		File1=1
    
	fi 
	

done	

File2=1

while [ $File2 -eq 1 ]

do

	curl -s --disable-epsv  -u anonymous:USER_ID@INSTITUTION -o GFS_06h ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/gfs.$InitDateTime/gfs.t00z.pgrb2.0p50.f006

	if [ $? -eq 0 ]

	then

    		File2=2
	
	else

    		File2=1
    
	fi 
	

done


File3=1

while [ $File3 -eq 1 ]

do

	curl -s --disable-epsv  -u anonymous:USER_ID@INSTITUTION -o GFS_12h ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/gfs.$InitDateTime/gfs.t00z.pgrb2.0p50.f012

	if [ $? -eq 0 ]

	then

    		File3=2
	
	else

    		File3=1
    
	fi 
	

done

File4=1

while [ $File4 -eq 1 ]

do

	curl -s --disable-epsv  -u anonymous:USER_ID@INSTITUTION -o GFS_18h ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/gfs.$InitDateTime/gfs.t00z.pgrb2.0p50.f018

	if [ $? -eq 0 ]

	then

    		File4=2
	
	else

    		File4=1
    
	fi 
	

done

File5=1

while [ $File4 -eq 1 ]

do

	curl -s --disable-epsv  -u anonymous:USER_ID@INSTITUTION -o GFS_18h ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/gfs.$InitDateTime/gfs.t00z.pgrb2.0p50.f024

	if [ $? -eq 0 ]

	then

    		File5=2
	
	else

    		File5=1
    
	fi 
	

done

echo ""
echo "******************************************************************************************************************"
ls -l
echo "******************************************************************************************************************"
echo ""
echo ""
echo ""


echo -e "Can you see GFS_00h , GFS_06h , GFS_12h , GFS_18h between the Asterix Lines ? [y/n] : \c"
read Ans
if [ $Ans = "Y" -o $Ans = "y" ]

then

    echo "GFS Data Fetch is Successful !!"

else

    echo "GFS Data Fetch is Unsuccessful, probably due to poor internet network !!"	

    echo "Run the Script Again !!"

    exit 0
    
fi 


