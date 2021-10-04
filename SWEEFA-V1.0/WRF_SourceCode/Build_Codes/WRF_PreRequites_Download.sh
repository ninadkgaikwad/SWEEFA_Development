#!/bin/bash

clear

banner "WRF Pre-Requisite Downloads"
echo ""
echo ""
echo -e "Do you want to proceed ? [y/n] : \c"
read Ans

if [ $Ans = "Y" -o $Ans = "y" ]

then

    echo ""
    echo ""
    echo ""
    echo ""
    banner "Updating and Upgrading the Linux System"
    echo ""
    echo ""
    
    sudo apt-get update
    sudo apt-get upgrade
    sudo apt-get dist-upgrade
    
    echo ""
    echo ""
    echo ""
    echo ""   
    banner "Downloading Shells : tcsh and csh"
    echo ""
    echo ""
    
    sudo apt-get install tcsh
    sudo apt-get install csh 

    echo ""
    echo ""
    echo ""
    echo ""   
    banner "Downloading GNU Compilers: gcc, g++ and gfortran "
    echo ""
    echo "" 

    sudo apt-get install gcc
    sudo apt-get install g++
    sudo apt-get install gfortran

    echo ""
    echo ""
    echo ""
    echo ""   
    banner "Downloading Visualization Tools "
    echo ""
    echo ""
    
    sudo apt-get install ncl-ncarg	
    
    echo ""
    echo ""
    echo ""
    echo ""   
    banner "Creating Appropriate Directories"
    echo ""
    echo ""
    echo -e " Enter User Directory Name: \c"
    read Ans

    mkdir /home/$Ans/Build_WRF
    mkdir /home/$Ans/Build_WRF/TESTS 	
    mkdir /home/$Ans/Build_WRF/LIBRARIES 
    mkdir /home/$Ans/Build_WRF/DATA 
    mkdir /home/$Ans/Build_WRF/WPS_GEOG 
    
    echo ""
    echo ""
    echo ""
    echo ""   
    banner "Your Linux System is now READY for WRF Compilation "
    echo ""
    echo ""

    exit 0
        
    
else

    exit 0
    
fi

exit 0    

    
