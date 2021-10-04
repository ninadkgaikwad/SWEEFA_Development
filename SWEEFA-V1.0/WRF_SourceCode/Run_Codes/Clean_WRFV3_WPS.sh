#!/bin/bash

clear


banner "WRF-WPS Cleaner"
echo ""
echo ""
echo ""
echo ""
echo "This Program will clean the WPS and WRF Output Files"
echo ""
echo ""
echo ""


echo -e "Enter your User Folder Name  : \c"
read Unam
echo ""
echo ""
echo "Select one option from the following:"
echo "Option 1: Clean all GFS, geogrid, ungrib, metgrid and WRF output Files"
echo "Option 2: Clean GFS, ungrib, metgrid and WRF output Files not geogrid Files "
echo ""
echo ""
echo -e "Cleaning Option [1/2]  : \c"
read Num

if [ $Num -eq 1 ]

    cd /home/$Unam/Build_WRF/DATA

    rm GFS_*

    cd /home/$Unam/Build_WRF/WPS

    rm geo_em*
    rm FILE_*
    rm met_em*
    
    cd /home/$Unam/Build_WRF/WRFV3/test/em_real
    
    rm wrfbdy_*
    rm wrfinput_*
    rm wrfout_*
    
    cd /home/$Unam/Build_WRF/DATA 
    echo "Data Folder:"
    echo "******************************************************************************************************************"
    echo ""
    echo "GFS Files:"
    ls -l GFS_*
    echo ""
    echo ""    
    echo "******************************************************************************************************************"
    echo ""    
 
    cd /home/$Unam/Build_WRF/WPS 
    echo "WPS Folder:"
    echo "******************************************************************************************************************"
    echo ""
    echo "Geogrid Files:"
    ls -l geo_em*
    echo ""
    echo "Ungrib Files:"
    ls -l FILE_*
    echo ""
    echo "Metgrid Files:"
    ls -l met_em*
    echo ""
    echo ""    
    echo "******************************************************************************************************************"
    echo ""    
    
    cd /home/$Unam/Build_WRF/WRFV3/test/em_real 
    echo "WRFV3/test/em_real Folder:"
    echo "******************************************************************************************************************"
    echo ""
    echo "WRF Input Files:"
    ls -l wrfinput_*
    echo ""
    echo "Lateral Boundary Files:"
    ls -l wrfbdy_*
    echo ""
    echo "WRF Output Files:"
    ls -l wrfout_*
    echo ""
    echo ""    
    echo "******************************************************************************************************************"
    echo ""        
    
then

    cd /home/$Unam/Build_WRF/DATA

    rm GFS_*

    cd /home/$Unam/Build_WRF/WPS

    rm FILE_*
    rm met_em*
    
    cd /home/$Unam/Build_WRF/WRFV3/test/em_real
    
    rm wrfbdy_*
    rm wrfinput_*
    rm wrfout_*
    
    cd /home/$Unam/Build_WRF/DATA 
    echo "Data Folder:"
    echo "******************************************************************************************************************"
    echo ""
    echo "GFS Files:"
    ls -l GFS_*
    echo ""
    echo ""    
    echo "******************************************************************************************************************"
    echo ""       
    
    cd /home/$Unam/Build_WRF/WPS 
    echo "WPS Folder:"
    echo "******************************************************************************************************************"
    echo ""
    echo "Ungrib Files:"
    ls -l FILE_*
    echo ""
    echo "Metgrid Files:"
    ls -l met_em*
    echo ""
    echo ""    
    echo "******************************************************************************************************************"
    echo ""    
    
    cd /home/$Unam/Build_WRF/WRFV3/test/em_real 
    echo "WRFV3/test/em_real Folder:"
    echo "******************************************************************************************************************"
    echo ""
    echo "WRF Input Files:"
    ls -l wrfinput_*
    echo ""
    echo "Lateral Boundary Files:"
    ls -l wrfbdy_*
    echo ""
    echo "WRF Output Files:"
    ls -l wrfout_*
    echo ""
    echo ""    
    echo "******************************************************************************************************************"
    echo ""         


fi    



echo ""
echo -e "Do you see any files in between the asterix lines? [y/n] : \c"
read Ans
if [ $Ans = "Y" -o $Ans = "y" ]

then

    echo " WPS and WRFV3 Folders have been cleaned successfully !!"

else

    echo " WPS and WRFV3 Folders have not been cleaned !!"
    
fi 

exit 0