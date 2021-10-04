#!/bin/bash

clear


banner "WRF Run"
echo ""
echo ""
echo ""
echo ""
echo "Before running WRF, Check the following:"
echo "1. WRF is Sucessfully Installed and compiled for either IDEAL CASE Run (ideal.exe and wrf.exe should be present in the main directory of WRFV3) or REAL CASE Run (real.exe, ndown.exe, tc.exe and wrf.exe should be present in the main directory of WRFV3)"
echo "2. WPS is Successfully Installed"
echo "3. met_em.d01.YYYY-MM-DD_hh:mm:ss.nc type Files are created in the WPS Directory (one each for the coresponding Intializing Meteorological File for the Parent Domain and one each for the Nested Domains)"
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
echo "The WRF model is a fully compressible and nonhydrostatic model (with a run-time
hydrostatic option). Its vertical coordinate is a terrain-following hydrostatic pressure
coordinate. The grid staggering is the Arakawa C-grid. The model uses the Runge-Kutta
2nd and 3rd order time integration schemes, and 2nd to 6th order advection schemes in
both the horizontal and vertical. It uses a time-split small step for acoustic and gravity-
wave modes. The dynamics conserves scalar variables"
echo ""
echo ""
echo ""
echo ""
echo "For Ideal Case (It does not require WPS Run) compilation of the WRF Code there are following two executables which are created:"
echo "1. ideal.exe : Initialization program which transforms the predefined output files from the metgrid.exe program of the WPS Run for working with the wrf.exe program"
echo "2. wrf.exe : A Numerical Integration Program"
echo ""
echo ""
echo ""
echo ""
echo "For Real Case compilation of the WRF Code there are following four executables which are created:"
echo "1. real.exe : Initialization program which transforms the output files from the metgrid.exe program of the WPS Run for working with the wrf.exe program"
echo "2. wrf.exe : A Numerical Integration Program"
echo "3. ndown.exe : A program to do one-way nesting"
echo "4. tc.exe : A program to do tropical storm
bogussing"
echo ""
echo ""
echo ""
echo ""


echo -e "Enter your User Folder Name  : \c"
read Unam

cd /home/$Unam/Build_WRF/WRFV3


echo ""
echo ""
echo ""
echo ""

echo "Select the Option from the following list :"
echo "1. Run WRF for Ideal Case"
echo "2. Run WRF for Real Case"
echo -e "Enter your selection : \c"
read Num
if [ $Num -eq 1 ]

then

	echo ""
	echo ""
	echo ""
	echo ""
	echo "You have Selected IDEAL CASE"
	echo ""
	echo ""
	echo ""
	echo ""
	echo ""
	echo "******************************************************************************************************************"
	ls -l /home/$Unam/Build_WRF/WRFV3/test
	echo "******************************************************************************************************************"
	echo ""
	echo ""
	echo ""

	echo -e "Enter the Ideal Case for which you have compiled the WRF Code : \c"
	read CaseName

	echo ""
	echo ""
	echo "******************************************************************************************************************"
	echo ""
        echo "In main Directory"
	ls -l /home/$Unam/Build_WRF/WRFV3/main/*.exe
	echo "******************************************************************************************************************"
	echo ""
	echo ""
	echo ""

	echo ""
	echo ""
	echo "******************************************************************************************************************"
	echo ""
        echo "In run Directory"
	ls -l /home/$Unam/Build_WRF/WRFV3/run/*.exe
	echo "******************************************************************************************************************"
	echo ""
	echo ""
	echo ""

	echo ""
	echo ""
	echo "******************************************************************************************************************"
	echo ""
        echo "In $CaseName Directory"
	ls -l /home/$Unam/Build_WRF/WRFV3/test/$CaseName/*.exe
	echo "******************************************************************************************************************"
	echo ""
	echo ""
	echo ""

	echo ""
	echo ""
	echo -e "Do you see :ideal.exe and wrf.exe between each of the asterix lines? [y/n] : \c"
	read Ans

	if [ $Ans = "Y" -o $Ans = "y" ]

	then

	    echo " The WRF Code is Successfully Compiled for your selected Ideal Case. Let us continue !!"

	else

	    exit 0

	fi

	echo ""
	echo ""


	StopIndicator=1

	while [ $StopIndicator -eq 1 ]

	do

		echo ""
		echo ""
		echo ""
		echo ""
		echo "nmaelist.input file serves as the runtime options for parameterization of the WRF Run as per our custom requirements"
		echo ""
		echo ""
		echo -e "Do you want to modify the namelist.input file ? [y/n] :\c"
		read Ans

		if [ $Ans = "Y" -o $Ans = "y" ]

		then

	    		StopIndicator=1

			nano /home/$Unam/Build_WRF/WRFV3/run/README.namelist
			nano /home/$Unam/Build_WRF/WRFV3/test/$CaseName/namelist.input
		else

	    		StopIndicator=2
		fi

	done

	echo ""
	echo ""
	echo "You have completed modifying the namelist.input file."
	echo "We are ready for running the WRF Code for the Ideal Case"
	echo ""
	echo ""

	echo -e "Do you want to proceed with running WRF for the selected case ? [y/n] : \c"
	read Ans
	if [ $Ans = "Y" -o $Ans = "y" ]

	then

	    cd test/$CaseName

	    if [ -a 'run_me_first.csh' ]

	    then

		   echo "run_me_first.csh Exists"

		   csh run_me_first.csh

	    elif [ -a 'create_links.sh' ]

	    then

		   echo "create_links.shExists"

		   ./create_links.sh


	    else

		   echo "Linking File for the Selected Ideal Case do not exist !!"

	    fi

	    echo ""
	    echo ""
	    echo "Running ideal.exe !!"

	    ./ideal.exe

	    echo ""
	    echo ""
	    echo "Select the type of run based on the compilation configuration of the WRF :"
	    echo "1. Serial Run (SMPR) : Does not require OpenMpi or Mpich. Usually used with Single copmuters or computers with ONE CORE"
	    echo "2. Distributed Memory Run (DMPR) : Requires OpenMpi or Mpich. Should be used with Cluster of Computers or Single Computer with MULTIPLE CORES"  
	    echo ""
	    echo ""
	    echo -e "Enter the Option Number [1/2] : \c"
	    read NNum
	    if [ $NNum -eq 1 ]

            then

		./wrf.exe >& wrf.out

		echo ""
		echo ""
		echo ""
		echo "******************************************************************************************************************"
		echo ""
		tail -n 10 wrf.out
		echo "******************************************************************************************************************"
		echo ""
		echo ""
		echo ""
		echo ""
		echo ""
		echo ""
		echo "******************************************************************************************************************"
		echo ""
                echo "In $CaseName Directory" 
		ls -l wrfout*
                ls -l wrfrst*
		echo ""
                echo "In run Directory" 
		ls -l /home/$Unam/Build_WRF/WRFV3/run/wrfout*
                ls -l /home/$Unam/Build_WRF/WRFV3/run/wrfrst*
		echo "******************************************************************************************************************"
		echo ""
		echo ""
		echo ""
		echo -e "Do you see : ‘wrf: SUCCESS COMPLETE WRF' and wrfout_d01_0001-01-01* ; wrfrst* type files. between the asterix lines ? [y/n] : \c"
		read Ans

		if [ $Ans = "Y" -o $Ans = "y" ]

		then

		    echo "WRF Run is Successful !!"

		    exit 0;

		else

		    echo "WRF Run was Unsuccessful !! Try Again !!"

		    exit 0

	       fi

	    elif [ $NNum -eq 2 ]

	    then

		echo -e "Enter Number of Processors to be allotted for WRF Run  : \c"
		read ProcessorNum

		mpirun -np $ProcessorNum ./wrf.exe   

                

		echo ""
		echo ""
		echo ""
		echo "******************************************************************************************************************"
		echo ""
		tail -n 10 rsl.*.0000
		echo "******************************************************************************************************************"
		echo ""
		echo ""
		echo ""
		echo ""
		echo ""
		echo ""
		echo "******************************************************************************************************************"
		echo ""
                echo "In $CaseName Directory" 
		ls -l wrfout*
                ls -l wrfrst*
		echo ""
                echo "In run Directory" 
		ls -l /home/$Unam/Build_WRF/WRFV3/run/wrfout*
                ls -l /home/$Unam/Build_WRF/WRFV3/run/wrfrst*
		echo "******************************************************************************************************************"
		echo ""
		echo ""
		echo ""
		echo -e "Do you see : ‘wrf: SUCCESS COMPLETE WRF' and wrfout_d01_0001-01-01* ; wrfrst* type files. between the asterix lines ? [y/n] : \c"

                read Ans 

		if [ $Ans = "Y" -o $Ans = "y" ]

		then

		    echo "WRF Run is Successful !!"

		    exit 0;

		else

		    echo "WRF Run was Unsuccessful !! Try Again !!"

		    exit 0

	        fi

	    else

		echo "Invalid Option is Selected. Try Again !!" 

		exit 0

	    fi


	else

	    exit 0

	fi


elif [ $Num -eq 2 ]

then

	echo ""
	echo ""
	echo ""
	echo ""
	echo "You have Selected REAL CASE"
	echo ""
	echo ""
	echo ""
	echo ""
	echo ""
	echo "******************************************************************************************************************"
	ls -l /home/$Unam/Build_WRF/WRFV3/test
	echo "******************************************************************************************************************"
	echo ""
	echo ""
	echo ""

	echo -e "Enter the Real Case for which you have compiled the WRF Code : \c"
	read CaseName

	echo ""
	echo ""
	echo "******************************************************************************************************************"
	echo ""
        echo "In main Directory"
	ls -l /home/$Unam/Build_WRF/WRFV3/main/*.exe
	echo "******************************************************************************************************************"
	echo ""
	echo ""
	echo ""

	echo ""
	echo ""
	echo "******************************************************************************************************************"
	echo ""
        echo "In run Directory"
	ls -l /home/$Unam/Build_WRF/WRFV3/run/*.exe
	echo "******************************************************************************************************************"
	echo ""
	echo ""
	echo ""

	echo ""
	echo ""
	echo "******************************************************************************************************************"
	echo ""
        echo "In $CaseName Directory"
	ls -l /home/$Unam/Build_WRF/WRFV3/test/$CaseName/*.exe
	echo "******************************************************************************************************************"
	echo ""
	echo ""
	echo ""

	echo ""
	echo ""
	echo -e "Do you see :real.exe ; wrf.exe ; ncdown.exe and tc.exe between each of the asterix lines? [y/n] : \c"
	read Ans
	if [ $Ans = "Y" -o $Ans = "y" ]

	then

	    echo " The WRF Code is Successfully Compiled for the Real Case. Let us continue !!"

	else

	    exit 0

	fi

	echo ""
	echo ""


	StopIndicator=1

	while [ $StopIndicator -eq 1 ]

	do

		echo ""
		echo ""
		echo ""
		echo ""
		echo "nmaelist.input file serves as the runtime options for parameterization of the WRF Run as per our custom requirements"
		echo ""
		echo ""
		echo -e "Do you want to modify the namelist.input file ? [y/n] :\c"
		read Ans

		if [ $Ans = "Y" -o $Ans = "y" ]

		then

	    		StopIndicator=1

			nano /home/$Unam/Build_WRF/WRFV3/run/README.namelist
			nano /home/$Unam/Build_WRF/WRFV3/test/$CaseName/namelist.input

		else

	    		StopIndicator=2

		fi

	done

	echo ""
	echo ""
	echo "You have completed modifying the namelist.input file."
	echo "We are ready for running the WRF Code for the Real Case"
	echo ""
	echo ""

	echo -e "Do you want to proceed with running WRF for the Real Case ? [y/n] : \c"
	read Ans
	if [ $Ans = "Y" -o $Ans = "y" ]

	then


	    cd test/$CaseName

            echo "Before Running WRF for the Real Case, the WPS program should be successfully completed"

	    echo ""
	    echo ""
	    echo ""
            echo "******************************************************************************************************************"
		echo ""
		ls -l /home/$Unam/Build_WRF/WPS/met_em*
		echo "******************************************************************************************************************"
	    echo ""
	    echo ""
	    echo ""
		echo -e "Do you see : met_em* type files. between the asterix lines ? [y/n] : \c"
		read Ans

		if [ $Ans = "Y" -o $Ans = "y" ]

		then

		    echo "WPS Run iwas Successful !! Let us continue"



		else

		    echo "WPS Run iwas Unsuccessful !! Try Again !!"

		    exit 0

	        fi


            echo "Linking met files from WPS Run to WRF"

            ln -sf /home/$Unam/Build_WRF/WPS/met_em* /home/$Unam/Build_WRF/WRFV3/test/$CaseName
            cd /home/$Unam/Build_WRF/WRFV3/run
            ln -sf /home/$Unam/Build_WRF/WPS/met_em* /home/$Unam/Build_WRF/WRFV3/run
            cd /home/$Unam/Build_WRF/WRFV3/test/$CaseName

	    echo ""
	    echo ""
	    echo ""
            echo "******************************************************************************************************************"
		echo ""
                echo "In $CaseName Directory"
		ls -l /home/$Unam/Build_WRF/WRFV3/test/$CaseName/met_em*
                echo ""
                echo "In run Directory"
                ls -l /home/$Unam/Build_WRF/WRFV3/run/met_em*
		echo "******************************************************************************************************************"
	    echo ""
	    echo ""
	    echo ""
		echo -e "Do you see : met_em* type files as symbolic links between the asterix lines ? [y/n] : \c"
		read Ans

		if [ $Ans = "Y" -o $Ans = "y" ]

		then

		    echo "Linking of WPS Ouput to WRF is Successful !! Let us continue"



		else

		    echo "Linking of WPS Ouput to WRF is Unsuccessful !! Try Again !!"

		    exit 0

	        fi


	    echo ""
	    echo ""
	    echo "Running real.exe !!"

	    echo ""
	    echo ""
	    echo "Select the type of run based on the compilation configuration of the WRF :"
	    echo "1. Serial Run (SMPR) : Does not require OpenMpi or Mpich. Usually used with Single copmuters or computers with ONE CORE"
	    echo "2. Distributed Memory Run (DMPR) : Requires OpenMpi or Mpich. Should be used with Cluster of Computers or Single Computer with MULTIPLE CORES"  
	    echo ""
	    echo ""
	    echo -e "Enter the Option Number [1/2] : \c"
	    read NNum
	    if [ $NNum -eq 1 ]

            then

		./real.exe >& real.out

		echo ""
		echo ""
		echo ""
		echo "******************************************************************************************************************"
		echo ""
		tail -n 10 real.out
		echo "******************************************************************************************************************"
		echo ""
		echo ""
		echo ""
		echo ""
		echo ""
		echo ""
		echo "******************************************************************************************************************"
		echo ""
		ls -l
		echo ""
		ls -l /home/$Unam/Build_WRF/WRFV3/run
		echo "******************************************************************************************************************"
		echo ""
		echo ""
		echo ""
		echo -e "Do you see : ‘ SUCCESS ' and wrfbdy_d01 ; wrfinput_d0* type files. between the asterix lines ? [y/n] : \c"
		read Ans

		if [ $Ans = "Y" -o $Ans = "y" ]

		then

		    echo "real.exe Run is Successful !!"


		else

		    echo "real.exe Run was Unsuccessful !! Try Again !!"

		    exit 0

	        fi


	    elif [ $NNum -eq 2 ]

	    then

		echo -e "Enter Number of Processors to be allotted for WRF Run  : \c"
		read ProcessorNum

		mpirun -np $ProcessorNum ./real.exe 

                
		echo ""
		echo ""
		echo ""
		echo "******************************************************************************************************************"
		echo ""
		tail -n 10 rsl.*.0000
		echo "******************************************************************************************************************"
		echo ""
		echo ""
		echo ""
		echo ""
		echo ""
		echo ""
		echo "******************************************************************************************************************"
		echo ""
                echo "In $CaseName Directory"
		ls -l wrfbdy_*
                ls -l wrfinput_*
		echo ""
                echo "In run Directory"
		ls -l /home/$Unam/Build_WRF/WRFV3/run/wrfbdy_*
                ls -l /home/$Unam/Build_WRF/WRFV3/run/wrfinput_*
		echo "******************************************************************************************************************"
		echnyo ""
		echo ""
		echo ""
		echo -e "Do you see : ‘ SUCCESS ' and wwrfbdy_d01 ; wrfinput_d0* type files. between the asterix lines ? [y/n] : \c"

                read -r Ans 0<&3	

		if [ $Ans = "Y" -o $Ans = "y" ]

		then

		    echo "real.exe Run is Successful !!"


		else

		    echo "real.exe Run was Unsuccessful !! Try Again !!"

		    exit 0

	        fi

	    else

		echo "Invalid Option is Selected. Try Again !!" 



                exit 0

	    fi

	    echo ""
	    echo ""
	    echo "Running wrf.exe !!"

	    echo ""
	    echo ""
	    echo "Select the type of run based on the compilation configuration of the WRF :"
	    echo "1. Serial Run (SMPR) : Does not require OpenMpi or Mpich. Usually used with Single copmuters or computers with ONE CORE"
	    echo "2. Distributed Memory Run (DMPR) : Requires OpenMpi or Mpich. Should be used with Cluster of Computers or Single Computer with MULTIPLE CORES"  
	    echo ""
	    echo ""
	    echo -e "Enter the Option Number [1/2] :  \c"

            read 
	    if [ $NNum -eq 1 ]

            then

		./wrf.exe >& wrf.out

		echo ""
		echo ""
		echo ""
		echo "******************************************************************************************************************"
		echo ""
		tail -n 10 wrf.out
		echo "******************************************************************************************************************"
		echo ""
		echo ""
		echo ""
		echo ""
		echo ""
		echo ""
		echo "******************************************************************************************************************"
		echo ""
                echo "In $CaseName Directory" 
		ls -l wrfout*
                ls -l wrfrst*
		echo ""
                echo "In run Directory" 
		ls -l /home/$Unam/Build_WRF/WRFV3/run/wrfout*
                ls -l /home/$Unam/Build_WRF/WRFV3/run/wrfrst*
		echo "******************************************************************************************************************"
		echo ""
		echo ""
		echo ""
		echo -e "Do you see : ‘wrf: SUCCESS COMPLETE WRF' and wrfout_d01_0001-01-01* ; wrfrst* type files. between the asterix lines ? [y/n] : \c"

                read Ans 

		if [ $Ans = "Y" -o $Ans = "y" ]

		then

		    echo "WRF Run is Successful !!"

		    exit 0;

		else

		    echo "WRF Run was Unsuccessful !! Try Again !!"

		    exit 0

	        fi


	    elif [ $NNum -eq 2 ]

	    then

		echo -e "Enter Number of Processors to be allotted for WRF Run  :  \c"

                read ProcessorNum 

		mpirun -np $ProcessorNum ./wrf.exe   

                
		echo ""
		echo ""
		echo ""
		echo "******************************************************************************************************************"
		echo ""
		tail -n 10 rsl.*.0000
		echo "******************************************************************************************************************"
		echo ""
		echo ""
		echo ""
		echo ""
		echo ""
		echo ""
		echo "******************************************************************************************************************"
		echo ""
                echo "In $CaseName Directory" 
		ls -l wrfout*
                ls -l wrfrst*
		echo ""
                echo "In run Directory" 
		ls -l /home/$Unam/Build_WRF/WRFV3/run/wrfout*
                ls -l /home/$Unam/Build_WRF/WRFV3/run/wrfrst*
		echo "******************************************************************************************************************"
		echo ""
		echo ""
		echo ""
		echo -e "Do you see : ‘wrf: SUCCESS COMPLETE WRF' and wrfout_d01_0001-01-01* ; wrfrst* type files. between the asterix lines ? [y/n] : \c"

                read Ans  

		if [ $Ans = "Y" -o $Ans = "y" ]

		then

		    echo "WRF Run is Successful !!"

		    exit 0;

		else

		    echo "WRF Run was Unsuccessful !! Try Again !!"

		    exit 0

	        fi

	    else

		echo "Invalid Option is Selected. Try Again !!"

		exit 0

	    fi


	else

	    exit 0

	fi


else

    echo "Selected option is not appropriate"

    exit 0

fi

exit 0


