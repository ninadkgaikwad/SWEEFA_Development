#!/bin/bash

clear


banner "WPS Run"
echo ""
echo ""
echo ""
echo ""
echo "Before running WPS, Check the following:"
echo "1. WRF is Successfully Installed"
echo "2. WPS is Successfully Installed"
echo "3. Static Geographical Data Set is Unzipped in /home/User/Build_WRF/WPS_GEOG "
echo "4. GFS Data is Fetched properly and loaded in /home/User/Build_WRF/DATA "
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

echo ""
echo ""
echo ""
echo ""
echo "WPS is a set of THREE PROGRAMS which have to be run in a sequential order as follows, They create the INPUT Files for the WRF PROGRAM"
echo "1. geogrid.exe : It defines Simulation Domains and interpolates the Static Geographic Datasets to the model grids"
echo "2. ungrib.exe : It reads GRIB Files, 'degribs' data and writes in an Intermediate Format. GRIB Files Contain time-varying meteorological data from another regional or global model such as NAM or GFS (here we use GFS)"
echo "3. metgrid.exe  : It horizontally interpolates the intermediate-format meteorological data that are extracted by ungrib.exe onto the simulation domains defined by geogrid.exe"
echo ""
echo ""
echo ""
echo ""


echo -e "Enter your User Folder Name  : \c"
read Unam

cd /home/$Unam/Build_WRF/WPS


echo ""
echo "******************************************************************************************************************"
ls -l
echo "******************************************************************************************************************"
echo ""
echo ""
echo ""
echo -e "Do you see : geogrid.exe -> geogrid/src/geogrid.exe ; ungrib.exe -> ungrib/src/ungrib.exe ; metgrid.exe -> metgrid/src/metgrid.exe  between the asterix lines? [y/n] : \c"
read Ans
if [ $Ans = "Y" -o $Ans = "y" ]

then

    echo " Symbolic Links to the three WPS Programs : geogrid.exe ; metgrid.exe and ungrib.exe are present. Let us continue !!"

else

    exit 0
    
fi 

echo ""
echo ""
echo ""
echo ""
echo "******************************************************************************************************************"

echo "Running geogrid.exe"

echo "******************************************************************************************************************"
echo ""
echo ""
echo ""
echo ""
echo ""
echo "To customize the Simulation Domain Grids we have to edit &share and &geogrid section in the namelist.wps file"
echo "NOTE : The comma separated values in the namelist.wps file are for the values corresponding to the respective nested domains. The number of comma separated values should atleast be equal to the number total domains, but not less."
echo ""
echo ""
echo "Typical changes in the &share section are:"
echo ""
echo ""
echo "wrf_core = 'ARW' or 'NMM' ; one of the two dynamic solvers"
echo "max_dom = Total number of domains in the simulation (Parent + Nests)"
echo ""
echo ""
echo "Typical changes in the &geogrid section are:"
echo ""
echo ""
echo "parent_id = 1, 1, 2, ; It gives the identity of the parent of the respective domain, parent of main domain is itsellf. The 1, 1, 2 indicates that, the main domain is child of itself, the second domain is child of main domain and the third domain is the child of the second domain"
echo ""
echo ""
echo "parent_grid_ratio = 1, 3 ; It determines the nominal grid spacing for a nest in relation to the grid spacing of its parent. The 1, 3, here indicate that the grid spacing in the nested domain will be one third of its parent. Usually 3 or 5 are preffered, we will be using 3"
echo ""
echo ""
echo "i_parent_start = 1, 31, ; It gives the east-west location of the nested domain grid w.r.t its parent grid. For main domain it should usually be 1. The 31 here shows that the nested domain starts at 31st east-west grid point of the main domain"
echo ""
echo ""
echo "j_parent_start = 1, 17, ; It gives the north-south location of the nested domain grid w.r.t its parent grid. For main domain should usually be 1.  The 17 here shows that the nested domain starts at 17th north-south grid point of the main domain"
echo ""
echo ""
echo "s_we = 1, 1, ; It gives starting grid points for parent and all nested grids w.r.t respective grid in the east-west axis. It should be usually 1"
echo ""
echo ""
echo "e_we = 73, 112, ; It gives ending grid points for parent and all nested grids w.r.t respective grid in the east-west axis. The 73, 112, here represent that the main grid has 74 grid points in the east-west axis, whereas the nested grid has 112 grid points in the east-west axis. To ensure that the upper-
right corner of the nest's grid is coincident with an unstaggered grid point in the parent
domain, both e_we and e_sn must be one greater than some integer multiple of the
nesting ratio "
echo ""
echo ""
echo "s_sn = 1, 1, ; It gives starting grid points for parent and all nested grids w.r.t respective grid in the east-west axis. It should be usually 1"
echo ""
echo ""
echo "e_sn = 61, 97, ; It gives ending grid points for parent and all nested grids w.r.t respective grid in the north-south axis. The 61, 97, here represent that the main grid has 61 grid points in the east-west axis, whereas the nested grid has 97 grid points in the north-south axis. To ensure that the upper-
right corner of the nest's grid is coincident with an unstaggered grid point in the parent
domain, both e_we and e_sn must be one greater than some integer multiple of the
nesting ratio"
echo ""
echo ""
echo "geog_data_res = '10m','2m', ; It gives the static geographic resolutions to be used for main and nested grids respectively.  "
echo ""
echo ""
echo "dx = 30000 ; It is defined only for main grid. It give the the grid spacing in meters (lambert/mercator/polar) or in degrees(lat-lon) in the x i.e. the east-west direction"
echo ""
echo ""
echo "dy = 30000 ; It is defined only for main grid. It give the the grid spacing in meters (lambert/mercator/polar) or in degrees(lat-lon) in the y i.e. the north-south direction"
echo ""
echo ""
echo "map_proj = 'lambert' , 'mercator' , 'polar' , 'lat-lon' , ; It gives the type of map projection to be used, we have four options: "
echo "1. Lambert Conformal/'lambert' : This map projecton gives least distortion for mid-latitude domains"
echo "2. Mercator/'mercator' : This map projecton gives least distortion for low-latitude domains with a good west-east extent"
echo "3. Polar Stereographic/'polar' : This map projecton gives least distortion for high latitude domains"
echo "4. Cylindrical Equidistant or Regular Latitude-Longitude/'lat-lon' : It is predominantly is used for global forecasts. However, its rotated aspect can be well-suited for regional domains anywhere on earth's surface."
echo ""
echo ""
echo "ref_lat = 34.83 ; It gives the Latitude of the centre of the Main Grid. It has to be defined for all the Map Projections"
echo ""
echo ""
echo "ref_lon = -81.03 ;  It gives the longitude of the centre of the Main Grid. It has to be defined for all the Map Projections"
echo ""
echo ""
echo "true_lat1 = 30 ; It has to be specified for lambert, mercator and polar map projections. No distortion in the distances in the map projection at this latitude"
echo ""
echo ""
echo "true_lat2 = 60 ; It is an optional parameter for lambert map projection"
echo ""
echo ""
echo "stand_lon = -98. , -ref_lon  (lat-lon/Norther Hemisphere), 180.0 - ref_lon (lat-lon/Southern Hemisphere); It has to be specified for lambert, polar and lat-lon map projections"
echo ""
echo ""
echo "pole_lat = 90.0 - ref_lat (Norther Hemisphere) , 90.0 + ref_lat (Southern Hemisphere) ; It has to be specified for lat-lon map projection"
echo ""
echo ""
echo "pole_lon = 180.0 (Norther Hemisphere) , 0.0 (Southern Hemisphere) ; It has to be specified for lat-lon map projection"
echo ""
echo ""
echo "geog_data_path = '/mmm/users/wrfhelp/WPS_GEOG/' ; It is the path where we have unzipped the Static Geographic files"
echo ""
echo ""

echo -e "Read the above comments properly. If still not clear read the ARW User Guide for more clarity. Are you ready to modify the namelist.wps file for running geogrid.exe  ? [y/n] : \c"
read Ans
if [ $Ans = "Y" -o $Ans = "y" ]

then

    nano namelist.wps

else

    echo "Understand the namelist variables for geogrid.exe and try again !!"

    exit 0
        
fi 


echo "Depending on the value of the wrf_core namelist variable, the appropriate
GEOGRID.TBL file must be used with geogrid, since the grid staggerings that WPS
interpolates to differ between dynamical cores. For the ARW, the GEOGRID.TBL.ARW
file should be used, and for the NMM, the GEOGRID.TBL.NMM file should be used.
Selection of the appropriate GEOGRID.TBL is accomplished by linking the correct file
to GEOGRID.TBL in the geogrid directory (or in the directory specified by
opt_geogrid_tbl_path , if this variable is set in the namelist)."

echo ""
echo ""
echo "******************************************************************************************************************"

ls -l geogrid

echo "******************************************************************************************************************"
echo ""
echo ""
echo -e "Select the appropriate GEOGRID.TBL from the list between the asterix lines depending on the type of Static Geographic Data Files you are using to link it to the GEOGRID.TBL file in WPS directory: \c"
read Geogrid_User

cd geogrid

ln -sf $Geogrid_User GEOGRID.TBL

cd ..

echo ""
echo ""

echo ""
echo ""
echo "******************************************************************************************************************"

ls -l geogrid

echo "******************************************************************************************************************"
echo ""
echo ""

echo -e " Do you see GEOGRID.TBL -> GEOGRID.TBL.ARW in between the asterix lines ? [y/n] : \c"
read Ans
if [ $Ans = "Y" -o $Ans = "y" ]

then

    echo " The linking of appropriate Geogrid table is successful !! "

else 

    echo "The linking of appropriate Geogrid table is unsuccessful !!"

    exit 0
        
fi 

echo ""
echo ""

echo -e " You are ready to run geogrid.exe.Do you want to proceed ? [y/n] : \c"
read Ans
if [ $Ans = "Y" -o $Ans = "y" ]

then

    ./geogrid.exe

else

    echo "Exited WPS Run Environment!!"

    exit 0
        
fi 

echo ""
echo "******************************************************************************************************************"
ls -l 
echo "******************************************************************************************************************"
echo ""
echo ""

echo -e "Do you see ! Successful completion of geogrid.    ! on the shell and the geo_em.do1.nc type files for each of your domain between the asterix lines? [y/n] : \c"
read Ans
if [ $Ans = "Y" -o $Ans = "y" ]

then

    echo "geogrid.exe run was successful. Let us continue !!"

else

    echo "geogrid.exe did not run succesfully. Try again !!"

    exit 0
        
fi 

echo ""
echo ""
echo ""
echo ""
echo "******************************************************************************************************************"

echo "Running ungrib.exe"

echo "******************************************************************************************************************"
echo ""
echo ""
echo ""
echo ""
echo ""
echo "To customize the Simulation in accordance with the Initialization meteorological files we have to edit &share and &ungrib section in the namelist.wps file"
echo "NOTE : The comma separated values in the namelist.wps file are for the values corresponding to the respective nested domains. The number of comma separated values should atleast be equal to the number total domains, but not less."
echo ""
echo ""
echo "Typical changes in the &share section are:"
echo ""
echo ""
echo "start_date = '2008-03-24_12:00:00' , '2008-03-24_12:00:00' ; It gives the start date/time of the meteorological files for main and nested domains"
echo ""
echo ""
echo "end_date = '2008-03-24_18:00:00' , '2008-03-24_12:00:00' ; It gives the end date/time of the meteorological files for main and nested domains"
echo ""
echo ""
echo "NOTE : The start_date and end_date for the nested domains remains same i.e the start_date of the main domain"
echo ""
echo ""
echo "interval_seconds = 21600 ; It is the difference between the meteorological files in seconds. Here as difference is 6 hours, therefore, 6 hours*60 minutes*60 seconds = 21600 seconds"
echo ""
echo ""
echo "io_form_geogrid = 2 ; It gives the type of input files to the geogrid.exe program. The 2 here represents that the output files are in NETCDF format"
echo ""
echo ""
echo "Typical changes in the &ungrib section are:"
echo ""
echo ""
echo "out_format = 'WPS' , 'SI' , 'MM5' , ; It is used to select the format of
the intermediate data to be written by ungrib; the metgrid program can read any of the
formats supported by ungrib, and thus, any of 'WPS' , 'SI' , and 'MM5' may be specified
for out_format , although 'WPS' is recommended"
echo ""
echo ""
echo "prefix = 'FILE' ; To specify a path and prefix for the intermediate files with the prefix variable. For
example, if prefix were set to 'ARGRMET' , then the intermediate files created by ungrib would be named according to AGRMET:YYYY-MM-DD_HH, where YYYY-MM-DD_HH
is the valid time of the data in the file."
echo ""
echo ""

echo -e "Read the above comments properly. If still not clear read the ARW User Guide for more clarity. Are you ready to modify the namelist.wps file for running ungrib.exe  ? [y/n] : \c"
read Ans
if [ $Ans = "Y" -o $Ans = "y" ]

then

    nano namelist.wps

else

    echo "Understand the namelist variables for ungrib.exe and try again !!"

    exit 0
        
fi 

echo ""
echo ""
echo "After suitably modifying the namelist.wps file, a Vtable must be supplied, and the GRIB
files must be linked (or copied) to the filenames that are expected by ungrib. The WPS is
supplied with Vtable files for many sources of meteorological data, and the appropriate
Vtable may simply be symbolically linked to the file Vtable, which is the Vtable name
expected by ungrib."
echo ""
echo ""
echo "******************************************************************************************************************"

ls -l ungrib/Variable_Tables

echo "******************************************************************************************************************"
echo ""
echo ""

echo -e "Select the appropriate VTable from the list between the asterix lines depending on the source of meteorological GRIB Files you are using to link it to the VTable file in WPS directory: \c"
read Vtable_User



ln -sf ungrib/Variable_Tables/$Vtable_User Vtable



echo ""
echo ""
echo "The ungrib program will try to read GRIB files named GRIBFILE.AAA,
GRIBFILE.AAB, ..., GRIBFILE.ZZZ. In order to simplify the work of linking the GRIB
files to these filenames, a shell script, link_grib.csh, is provided. The link_grib.csh script
takes as a command-line argument a list of the GRIB files to be linked." 
echo ""
echo ""


echo "******************************************************************************************************************"

ls -l /home/$Unam/Build_WRF/DATA

echo "******************************************************************************************************************"
echo ""
echo ""      
 
echo -e "Give the Initial common string of the GRIB Meteorological Files which are seen in between the asterix lines to link them with grib.exe (For example if file name is : gfs_080324_12_00 ; then give : gfs) : \c"
read Init_Name

./link_grib.csh /home/$Unam/Build_WRF/DATA/
$Init_Name*

echo ""
echo ""
echo "******************************************************************************************************************"

ls -l 

echo "******************************************************************************************************************"
echo ""
echo ""  

echo -e "Can you see files such as GRIBFILE.AAA -> /data/gfs/gfs_080324_12_00 (one file per one GRIB Meteo File) and Vtable -> ungrib/Variable_Tables/Vtable.GFS in between the asterix lines ? [y/n] : \c"
read Ans
if [ $Ans = "Y" -o $Ans = "y" ]

then

    echo "The linking process of the GRIB Meteo Files and Vtable is Successfull. Let us continue !! "

else

    echo "The linking process of the GRIB Meteo Files and Vtable is Unsuccessfull. Try again  !!"

    exit 0
        
fi 

echo -e " You are ready to run ungrib.exe.Do you want to proceed ? [y/n] : \c"
read Ans
if [ $Ans = "Y" -o $Ans = "y" ]

then

    ./ungrib.exe

else

    echo "Exited WPS Run Environment!!"

    exit 0
        
fi


echo ""
echo ""
echo "******************************************************************************************************************"

tail 100 ungrib.output

echo "******************************************************************************************************************"
echo ""
echo "" 
echo ""
echo ""
echo "******************************************************************************************************************"

ls -l

echo "******************************************************************************************************************"
echo ""
echo "" 

echo -e " Do you see ! Successful completion of ungrib.
! in between the first asterix lines and files of format FILE:YYYY-MM-DD_HH (one each for one GRIB Meteo File)  ? [y/n] : \c"
read Ans
if [ $Ans = "Y" -o $Ans = "y" ]

then

    echo "ungrib.exe run was successful. Let us continue !! "

else

    echo "ungrib.exe run was unsuccessful. Try again !!"

    exit 0
        
fi 

echo ""
echo ""
echo ""
echo ""
echo "******************************************************************************************************************"

echo "Running metgrid.exe"

echo "******************************************************************************************************************"
echo ""
echo ""
echo ""
echo ""
echo "By this point, there is generally no need to change any of the variables in the “share”
namelist record, since those variables should have been suitably set in previous steps. If
the 'share' namelist was not edited while running geogrid and ungrib, however, the WRF
dynamical core, number of domains, starting and ending times, interval between
meteorological data, and path to the static domain files must be set in the “share”
namelist record, as described in the steps to run geogrid and ungrib."
echo ""
echo ""
echo "Typical changes in &metgrid section of the namelist.wps file are:"
echo ""
echo ""
echo "fg_name = 'FILE' ; It gives the path and filename prefix for the files created as output by the metgrid.exe program."
echo ""
echo ""
echo "io_form_metgrid = 2, ; It gives the output file type of the metgrid.exe program. The 2 here represents that the output of metgrid.exe will be in NETCDF format"
echo ""
echo ""

echo "As with geogrid and the GEOGRID.TBL file, a METGRID.TBL file appropriate for the
WRF core must be linked in the metgrid directory (or in the directory specified by
opt_metgrid_tbl_path , if this variable is set)."
echo ""
echo ""
echo -e "Read the above comments properly. If still not clear read the ARW User Guide for more clarity. Are you ready to modify the namelist.wps file for running metgrid.exe  ? [y/n] : \c"
read Ans
if [ $Ans = "Y" -o $Ans = "y" ]

then

    nano namelist.wps

else

    echo "Understand the namelist variables for metgrid.exe and try again !!"

    exit 0
        
fi 

echo "******************************************************************************************************************"

ls -l metgrid

echo "******************************************************************************************************************"
echo ""
echo ""
echo -e "Select the appropriate METGRID.TBL from the list between the asterix lines depending on the source of meteorological GRIB Files you are using to link it to the METGRID.TBL file in WPS directory: \c"
read Metgrid_User

cd metgrid

ln -sf $Metgrid_User METGRID.TBL

cd ..

echo ""
echo ""

echo ""
echo ""
echo "******************************************************************************************************************"

ls -l metgrid

echo "******************************************************************************************************************"
echo ""
echo ""

echo -e " Do you see METGRID.TBL -> METGRID.TBL.ARW in between the asterix lines ? [y/n] : \c"
read Ans
if [ $Ans = "Y" -o $Ans = "y" ]

then

    echo " The linking of appropriate Metgrid table is successful !! "

else 

    echo "The linking of appropriate Metgrid table is unsuccessful !!"

    exit 0
        
fi 

echo -e " We are ready to run the metgrid.exe program. Do you want to proceed ? [y/n] : \c"
read Ans
if [ $Ans = "Y" -o $Ans = "y" ]

then

    ./metgrid.exe

else 

    echo " Exited WPS Run Environment!! !!"

    exit 0
        
fi 

echo ""
echo ""
echo "******************************************************************************************************************"

ls -l 

echo "******************************************************************************************************************"
echo ""
echo ""

echo -e " Do you see ! Successful completion of metgrid.
! in the console, and files of type met_em.d01.2008-03-24_12:00:00.nc (one each for one domain) in between the asterix lines ? [y/n] : \c"
read Ans
if [ $Ans = "Y" -o $Ans = "y" ]

then

    echo " metgrid.exe run was sucessful. Let us continue. We are ready to run WRF !! "

else 

    echo "metgrid.exe run was unsucessful. Try again !!"

    exit 0
        
fi 
