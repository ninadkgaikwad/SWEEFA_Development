#!/bin/bash

clear


banner "WRF Geog Data"
echo ""
echo ""
echo ""
echo ""

echo "Before starting check that you have WPS_GEOG Directory in Build_WRF Directory"
echo "Atleast one Tar file from : geog1_new3.7.tar.bz2 ; geog_complete.tar.bz2 ; geog_minimum.tar.bz2 ; geog_new3.7.tar.bz2 should be present in the Build_WRF Directory "
echo ""
echo ""
echo ""
echo ""
echo -e "Do you fullfill above conditions ? [y/n] : \c"
read Ans
if [ $Ans = "Y" -o $Ans = "y" ]

then

    echo "Let us continue !!"

else

    exit 0
    
fi 

echo -e "Enter your User Folder Name  : \c"
read Unam

cd /home/$Unam/Build_WRF/WPS_GEOG
curl -k -O -L -s https://www2.mmm.ucar.edu/wrf/src/wps_files/geog_minimum.tar.bz2    

echo ""
echo ""
echo ""
echo ""
echo "1. geog1_new3.7.tar.bz2 : expands to about 50 Gb"
echo ""
echo "2. geog_complete.tar.bz2 : expands to about 50 Gb"
echo ""
echo "3. geog_minimum.tar.bz2 : expands to about 2.3 Gb"
echo ""
echo "4. geog_new3.7.tar.bz2 : expands to more than 100 Gb"
echo ""
echo ""
echo "Choose options wisely as per your system memory and simulation requirements"
echo ""
echo ""
echo ""
echo ""

echo -e "Select an appropriate File Number to unzip and be used as WPS Static Geographic Data ?  : \c"
read Num
if [ $Num -eq 1 ]

then

    bzip2 -d  geog1_new3.7.tar.bz2

    tar -xf geog1_new3.7.tar

elif [ $Num -eq 2 ]

then

    bzip2 -d  geog_complete.tar.bz2

    tar -xf geog_complete.tar

elif [ $Num -eq 3 ]

then

    bzip2 -d geog_minimum.tar.bz2

    tar -xf geog_minimum.tar

elif [ $Num -eq 4 ]

then

    bzip2 -d  geog_new3.7.tar.bz2

    tar -xf geog_new3.7.tar

else 

    exit 0
    
fi 

exit 0
