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
    sudo apt-get install m4
    sudo apt-get install libnetcdf-dev libnetcdff-dev


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
tar -xf Fortran_C_NETCDF_MPI_tests.tar
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

    cd /home/$Ans/Build_WRF/TESTS
    curl -k -O -L -s --compressed https://www2.mmm.ucar.edu/wrf/OnLineTutorial/compile_tutorial/tar_files/Fortran_C_tests.tar
    curl -k -O -L -s --compressed https://www2.mmm.ucar.edu/wrf/OnLineTutorial/compile_tutorial/tar_files/Fortran_C_NETCDF_MPI_tests.tar

    cd /home/$Ans/Build_WRF/LIBRARIES
    curl -k -O -L -s https://www2.mmm.ucar.edu/wrf/OnLineTutorial/compile_tutorial/tar_files/mpich-3.0.4.tar.gz
    curl -k -O -L -s https://www2.mmm.ucar.edu/wrf/OnLineTutorial/compile_tutorial/tar_files/netcdf-4.1.3.tar.gz
    curl -k -O -L -s https://www2.mmm.ucar.edu/wrf/OnLineTutorial/compile_tutorial/tar_files/jasper-1.900.1.tar.gz
    curl -k -O -L -s https://www2.mmm.ucar.edu/wrf/OnLineTutorial/compile_tutorial/tar_files/libpng-1.2.50.tar.gz
    curl -k -O -L -s https://www2.mmm.ucar.edu/wrf/OnLineTutorial/compile_tutorial/tar_files/zlib-1.2.7.tar.gz

    cd /home/$Ans/Build_WRF
    curl -k -O -L -s https://www2.mmm.ucar.edu/wrf/src/WRFV3.7.TAR.gz
    curl -k -O -L -s https://www2.mmm.ucar.edu/wrf/src/WPSV3.7.TAR.gz
        
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

    

