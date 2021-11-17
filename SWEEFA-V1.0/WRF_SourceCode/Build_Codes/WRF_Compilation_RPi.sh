#!/usr/bin/tcsh

clear

banner "WRF Compilation for 64-bit x86 Linux-Ubuntu Machine"
echo ""
echo ""
echo ""
echo ""

echo "Before starting Create Directory Build_WRF in home directory"
echo "Inside the Build_WRF Directory Make 2 sub-directories LIBRARIES and TESTS"
echo ""
echo ""
echo ""
echo ""

echo "Place the tar files of libraries (netcdf, mpich, zlib, libpng and Jasper) in the LIBRARIES Directory"
echo "Place the tar files of Tests (Fortran and C tests, and Fortran C NETCDF and MPI tests) in the TESTS Directory"
echo "Place the tar files of WRF and WPS version 3.7.1 in the main Build_WRF Directory"
echo "All the tar files are availabe at http://www2.mmm.ucar.edu/wrf/OnLineTutorial/compilation_tutorial.php#STEP3 "
echo ""
echo ""
echo ""
echo ""
echo -e "Do you want to continue ? [y/n] : \c"
read Ans
if [ $Ans = "Y" -o $Ans = "y" ]

then

    echo "Let us continue !!"

else

    exit 0
    
fi 

echo -e "Enter your User Folder Name  : \c"
read Unam


echo ""
echo ""
echo ""
echo ""
banner "Checking For Appropriate Compilers"
echo ""
echo ""
echo ""
echo ""
which gcc
which cpp
which gfortran
echo -e "Do you see locations of GNU compilers gcc, cpp and gfortran ? [y/n] : \c"
read Ans
if [ $Ans = "Y" -o $Ans = "y" ]

then

    echo "Let us continue !!"

else

    exit 0
    
fi    

echo ""
echo ""
echo ""
echo ""
banner "Checking For Appropriate Version of Compilers"
echo ""
echo ""
echo ""
echo ""
gcc --version
cpp --version
gfortran --version
g++ --version
echo -e "Are all your compiler versions higher or equal to 4.4.0 ? [y/n] : \c"
read Ans
if [ $Ans = "Y" -o $Ans = "y" ]

then

    echo "Let us continue !!"

else

    echo "Install latest versions of the compilers"
    exit 0
    
fi

echo ""
echo ""
echo ""
echo ""
banner "Checking For Unix Shells"
echo ""
echo ""
echo ""
echo ""
which bash
which tcsh
which csh
echo -e "Do you see locations of GNU compilers gcc, cpp and gfortran ? [y/n] : \c"
read Ans
if [ $Ans = "Y" -o $Ans = "y" ]

then

    echo "Let us continue !!"

else

    echo "Install the required Unix Shells"
    exit 0
    
fi

cd /home/$Unam/Build_WRF/TESTS
echo ""
echo ""
echo ""
echo ""
banner "Testing of the Compilers"
echo ""
echo ""
echo ""
echo ""
tar -xf Fortran_C_tests.tar
banner "TEST 1: Fixed Format Fortran Test"
echo ""
echo ""
echo ""
echo ""
gfortran TEST_1_fortran_only_fixed.f
./a.out
echo ""
echo ""
echo ""
echo ""
banner "TEST 2: Free Format Fortran Test"
echo ""
echo ""
echo ""
echo ""
gfortran TEST_2_fortran_only_free.f90
./a.out
echo ""
echo ""
echo ""
echo ""
banner "TEST 3: C only Test"
echo ""
echo ""
echo ""
echo ""
gcc TEST_3_c_only.c
./a.out
echo ""
echo ""
echo ""
echo ""
banner "TEST 4: Fortran Calling a C Function"
echo ""
echo ""
echo ""
echo ""
gcc -c -m64 TEST_4_fortran+c_c.c
gfortran -c -m64 TEST_4_fortran+c_f.f90
gfortran -m64 TEST_4_fortran+c_f.o TEST_4_fortran+c_c.o
./a.out
echo ""
echo ""
echo ""
echo ""
banner "TEST 5: csh Test"
echo ""
echo ""
echo ""
echo ""
./TEST_csh.csh
echo ""
echo ""
echo ""
echo ""
banner "TEST 6: perl Test"
echo ""
echo ""
echo ""
echo ""
./TEST_perl.pl
echo ""
echo ""
echo ""
echo ""
banner "TEST 7: sh Test"
echo ""
echo ""
echo ""
echo ""
./TEST_sh.sh
echo ""
echo ""
echo ""
echo ""
echo -e "Do you see Success in each TEST ? [y/n]: \c"
read Ans
if [ $Ans = "Y" -o $Ans = "y" ]

then

    echo "Let us continue !!"

else

    echo "There is a problem with the compilers and/or shells. Please install required softwares and try again !!"
    exit 0
    
fi

cd /home/$Unam/Build_WRF/LIBRARIES
echo ""
echo ""
echo ""
echo ""
banner "Building Libraries"
echo ""
echo ""
echo ""
echo ""
export DIR=/home/$Unam/Build_WRF/LIBRARIES
export CC=gcc
export CXX=g++
export FC=gfortran
export FCFLAGS=-m64
export F77=gfortran
export FFLAGS=-m64
echo ""
echo ""
echo ""
echo ""
banner "Building NETCDF : It will take time be patient"
echo ""
echo ""
echo ""
echo ""
tar xzvf netcdf-4.1.3.tar.gz     
cd netcdf-4.1.3
./configure --prefix=$DIR/netcdf --disable-dap --disable-netcdf-4 --disable-shared
make
make install
export PATH=$DIR/netcdf/bin:$PATH
export NETCDF=$DIR/netcdf
cd ..
echo ""
echo ""
echo ""
echo ""
banner "Building MPICH : It will take time be patient"
echo ""
echo ""
echo ""
echo ""
tar xzvf mpich-3.0.4.tar.gz    
cd mpich-3.0.4
./configure --prefix=$DIR/mpich
make
make install
export PATH=$DIR/mpich/bin:$PATH
cd ..
echo ""
echo ""
echo ""
echo ""
banner "Building zlib"
echo ""
echo ""
echo ""
echo ""
export LDFLAGS=-L$DIR/grib2/lib 
export CPPFLAGS=-I$DIR/grib2/include 
tar xzvf zlib-1.2.7.tar.gz     
cd zlib-1.2.7
./configure --prefix=$DIR/grib2
make
make install
cd ..
echo ""
echo ""
echo ""
echo ""
banner "Building libpng"
echo ""
echo ""
echo ""
echo ""
tar xzvf libpng-1.2.50.tar.gz     
cd libpng-1.2.50
./configure --prefix=$DIR/grib2
make
make install
cd ..
echo ""
echo ""
echo ""
echo ""
banner "Building JasPer"
echo ""
echo ""
echo ""
echo ""
tar xzvf jasper-1.900.1.tar.gz     
cd jasper-1.900.1
./configure --prefix=$DIR/grib2
make
make install
cd ..

cd /home/$Unam/Build_WRF/TESTS
echo ""
echo ""
echo ""
echo ""
banner "Library Compatibility Tests"
echo ""
echo ""
echo ""
echo ""
tar -xf Fortran_C_NETCDF_MPI_tests.tar
echo ""
echo ""
echo ""
echo ""
banner "TEST 1: Fortran + C + NetCDF"
echo ""
echo ""
echo ""
echo ""
cp ${NETCDF}/include/netcdf.inc
gfortran -c 01_fortran+c+netcdf_f.f
gcc -c 01_fortran+c+netcdf_c.c 
gfortran 01_fortran+c+netcdf_f.o 01_fortran+c+netcdf_c.o -L${NETCDF}/lib -lnetcdff -lnetcdf
./a.out
echo ""
echo ""
echo ""
echo ""
banner "TEST 2: Fortran + C + NetCDF + MPI"
echo ""
echo ""
echo ""
echo ""
cp ${NETCDF}/include/netcdf.inc
mpif90 -c 02_fortran+c+netcdf+mpi_f.f
mpicc -c 02_fortran+c+netcdf+mpi_c.c
mpif90 02_fortran+c+netcdf+mpi_f.o 02_fortran+c+netcdf+mpi_c.o -L${NETCDF}/lib -lnetcdff -lnetcdf
mpirun ./a.out
echo -e "Do you see Success in each TEST ? [y/n]: \c"
read Ans
if [ $Ans = "Y" -o $Ans = "y" ]

then

    echo "Let us continue !!"

else

    echo "There is a problem installation of the Libraries use different versions. Please install required softwares and try again !!"
    exit 0
    
fi

cd /home/$Unam/Build_WRF
echo ""
echo ""
echo ""
echo ""
banner "Building WRFV3"
echo ""
echo ""
echo ""
echo ""
echo "You will see various options. Choose the option that lists the compiler you are using and the way you wish to build WRFV3 (i.e., serially or in parallel). Although there are 3 different types of parallel (smpar, dmpar, and dm+sm), we have the most experience with dmpar and typically recommend choosing this option.
"
echo "If you dont see any relevant option it means WRF has not been ported to your machine before, choose the closest configuration in /home/Build_WRF/WRFV3/arch/configure_new.defaults and paste in the end of the file. Change the Processor name string to you processor [Type 'uname -a' to get machine processor name]"
echo -e "Do you want to proceed ? [y/n] : \c"
read Ans
if [ $Ans = "Y" -o $Ans = "y" ]

then
    
    echo "Let us continue !!"
    
else

    exit 0
    
fi    
gunzip WRFV3.7.TAR.gz
tar -xf WRFV3.7.TAR
cd WRFV3
./clean

echo ""
echo ""
echo ""
echo ""
echo "Before configuring the WRF. We need to modify the configure script."
echo "Modifying /WRFV3/arch/configure_new.defaults, as it does not have"
echo "configuration file for the arm processor of the Raspberry Pi."
echo "In the file which will be opened in nano editor, find i486 i586 i686 Linux smpar/dmpar"
echo "No GRIB 2 should not be present in the option. There you have to do the following modifications:"
echo "1. Replace i486 i586 i686 with arm7l"
echo "2. Modify option from FCOPTIM = -O3 -ftree-vectorize -ftree-loop-linear -funroll-loops to FCOPTIM = -O2 -ftree-vectorize -funroll-loops"
echo ""
echo ""
echo -e "Do you want to proceed ? [y/n] : \c"
read Ans
if [ $Ans = "Y" -o $Ans = "y" ]

then
    
    nano /home/$Unam/Buid_WRF/WRFV3/arch/configure_new.defaults
    
else

    exit 0
    
fi 


./configure


echo ""
echo ""
echo ""
echo ""
echo "Before compiling the WRF. We need to modify the configure.wrf script."
echo "Modifying /WRFV3/configure.wrf, as it does not have"
echo "an option in regards to the gfortran compiler which is required for reading the C-style comments in the code"
echo "In the file opened in nano editor you have to do the following (add -cpp):"
echo "1. Modify option from FORMAT_FIXED    =   -ffixed-form  to FORMAT_FIXED    =   -ffixed-form -cpp "
echo "2. Modify option from FORMAT_FREE     =   -ffree-form -ffree-line-length-none  to FORMAT_FREE     =   -ffree-form -ffree-line-length-none -cpp"
echo ""
echo ""
echo -e "Do you want to proceed ? [y/n] : \c"
read Ans
if [ $Ans = "Y" -o $Ans = "y" ]

then
    
    nano /home/$Unam/Buid_WRF/WRFV3/configure.wrf
    
else

    exit 0
    
fi 


echo "Once your configuration is complete, you should have a configure.wrf file, and you are ready to compile. To compile WRFV3, you will need to decide which type of case you wish to compile. The options are listed below:"
echo "em_real (3d real case)"
echo "em_quarter_ss (3d ideal case)"
echo "em_b_wave (3d ideal case)"
echo "em_les (3d ideal case)"
echo "em_heldsuarez (3d ideal case)"
echo "em_tropical_cyclone (3d ideal case"
echo "em_hill2d_x (2d ideal case)"
echo "em_squall2d_x (2d ideal case)"
echo "em_squall2d_y (2d ideal case)"
echo "em_grav2d_x (2d ideal case)"
echo "em_seabreeze2d_x (2d ideal case)"
echo "em_scm_xy (1d ideal case)"
echo -e "Give your Selection: \c"
read Case
echo "Compilation can take 20-30 mins. Be patient !!"
./compile $Case >& log.compile
echo ""
echo ""
echo ""
echo ""
ls -ls main/*.exe
echo ""
echo ""
echo ""
echo ""
echo "If you compiled a real case, you should see:"
echo "wrf.exe (model executable)"
echo "real.exe (real data initialization)"
echo "ndown.exe (one-way nesting)"
echo "tc.exe (for tc bogusing--serial only)"
echo "If you compiled an idealized case, you should see:"
echo "wrf.exe (model executable)"
echo "ideal.exe (ideal case initialization)"
echo "These executables are linked to 2 different directories:"
echo "WRFV3/run"
echo "WRFV3/test/em_real"
echo "You can choose to run WRF from either directory."
echo ""
echo ""
echo ""
echo ""
echo -e "Do you see the above mentioned files ? [y/n]: \c"
read Ans
if [ $Ans = "Y" -o $Ans = "y" ]

then

    echo "Let us continue !!"

else

    echo "There is a problem in compilation.Look in log.compile file for errors and Check config.wrf and make appropriate changes to configure_new.defaults file in /home/Buld_WRF/WRFV3/arch !!"
    exit 0
    
fi

cd /home/$Unam/Build_WRF
echo ""
echo ""
echo ""
echo ""
banner "Building WPS"
echo ""
echo ""
echo ""
echo ""
gunzip WPSV3.7.TAR.gz
tar -xf WPSV3.7.TAR
cd WPS
./clean

export COMPRESSION_LIBS=$DIR/grib2/lib
export COMPRESSION_INC=$DIR/grib2/include

export JASPERLIB=$DIR/grib2/lib
export JASPERINC=$DIR/grib2/include

echo "You should be given a list of various options for compiler types," 
echo "whether to compile in serial or parallel, and whether to compile "
echo "ungrib with GRIB2 capability. Unless you plan to create extremely" 
echo "large domains, it is recommended to compile WPS in serial mode," 
echo "regardless of whether you compiled WRFV3 in parallel. It is also"
echo "recommended that you choose a GRIB2 option" 
echo "(make sure you do not choose one that states "NO_GRIB2")" 
echo "You may choose a non-grib2 option, but most data is now in grib2 format," 
echo "so it is best to choose this option. You can still run grib1 data when" 
echo "you have built with grib2."
echo -e "Do you want to proceed ? [y/n] : \c"
read Ans
if [ $Ans = "Y" -o $Ans = "y" ]

then
    
    echo "Let us continue !!"
    
else

    exit 0
    
fi 


echo ""
echo ""
echo ""
echo ""
echo "Before configuring the WPS. We need to modify the configure script."
echo "Modifying /WPS/arch/configure.defaults, as it does not have"
echo "configuration file for the arm processor of the Raspberry Pi."
echo "In the file which will be opened in nano editor, find i486 i586 i686 Linux smpar/dmpar"
echo "No GRIB 2 should not be present in the option. There you have to do the following modifications:"
echo "1. Replace i486 i586 i686 with arm7l"
echo "2. Modify option from FCOPTIM = -O3 -ftree-vectorize -ftree-loop-linear -funroll-loops to FCOPTIM = -O2 -ftree-vectorize -funroll-loops"
echo ""
echo ""
echo -e "Do you want to proceed ? [y/n] : \c"
read Ans
if [ $Ans = "Y" -o $Ans = "y" ]

then
    
    nano /home/$Unam/Buid_WRF/WPS/arch/configure.defaults
    
else

    exit 0
    
fi 


./configure

echo ""
echo ""

echo ""
echo ""
echo ""
echo ""
echo "Before compiling the WPS. We need to modify the configure.wps script."
echo "Modifying /WPS/configure.wps, as it does not have"
echo "an option in regards to the gfortran compiler which is required for reading the C-style comments in the code"
echo "In the file opened in nano editor you have to do the following (add -cpp):"
echo "1. Modify option from FORMAT_FIXED    =  -ffixed-form  to FORMAT_FIXED    =    -ffixed-form -cpp "
echo "2. Modify option from FORMAT_FREE     =  -ffree-form -ffree-line-length-none  to FORMAT_FREE     =   -ffree-form -ffree-line-length-none -cpp"
echo "3. COMPRESSION_LIBS	=	-L/home/pi/Build_WRF/LIBRARIES/grib2/lib backslash"
echo "                           -ljasper -lpng12 -lpng -lz"
echo "   COMPRES SION_INC   =	-I/home/pi/Build_WRF/LIBRARIES/grib2/include "
echo ""
echo -e "Do you want to proceed ? [y/n] : \c"
read Ans
if [ $Ans = "Y" -o $Ans = "y" ]

then
    
    nano /home/$Unam/Buid_WRF/WPS/configure.wps
    
else

    exit 0
    
fi 


echo "Compilation can take 20-30 mins. Be patient !!"
./compile >& log.compile
echo ""
echo ""
echo ""
echo ""
ls -ls *.exe
echo ""
echo ""
echo ""
echo ""
echo "If the compilation is successful, there should be 3 main executables in the WPS top-level directory:"
echo "geogrid.exe"
echo "ungrib.exe"
echo "metgrid.exe"
echo -e "Do you see the above mentioned files ? [y/n]: \c"
read Ans
if [ $Ans = "Y" -o $Ans = "y" ]

then

    echo "You have successfully completed WRF Compilation on your Host Machine !!"

else

    echo "There is a problem in compilation.Look in log.compile file for errors !!"
    exit 0
    
fi
