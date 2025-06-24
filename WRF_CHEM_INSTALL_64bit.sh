#!/bin/bash

## WRF-CHEM installation with parallel process.

#############################basic package managment############################
sudo apt install flex
############################ WRF-CHEM 4.4  #################################
## WRF-CHEM v4.4
########################################################################
cd $HOME/WRF/Downloads
export WRFIO_NCD_LARGE_FILE_SUPPORT=1
tar -xvzf WRF-4.4.tar.gz -C $HOME/WRF/WRF_CHEM/
cd $HOME/WRF/WRF_CHEM/WRFV4.4/chem/KPP/kpp/kpp-2.1/src
/usr/bin/flex scan.l
cd $HOME/WRF/WRF_CHEM/WRFV4.4/
./clean -a
sed -i -e 's/_WRF = "FALSE" ;/_WRF = "TRUE" ;/g' $HOME/WRF/WRF_CHEM/WRFV4.4/arch/Config.pl
sed -i -e 's/"$USENETCDFPAR" == "1"/"$USENETCDFPAR" = "1"/g' $HOME/WRF/WRF_CHEM/WRFV4.4/configure
./configure # option 34, option 1 for gfortran and distributed memory w/basic nesting
### Complie kpp.
./compile 2>&1 | tee compile_kpp.log
### Complie WRF_CHEM em_real mode.
./compile em_real 2>&1 | tee compile_wrf.log

##################### WPSV4.4 for WRF_CHEM #######################
## WPS v4.4
## Downloaded from git tagged releases
########################################################################
cd $HOME/WRF/Downloads
wget -c https://github.com/wrf-model/WPS/archive/refs/tags/v4.4.tar.gz -O WPS-4.4.tar.gz
tar -xvzf WPS-4.4.tar.gz -C $HOME/WRF/WRF_CHEM
cd $HOME/WRF/WRF_CHEM/WPS-4.4
./clean -a
./configure #Option 1 for gfortran 
./compile 2>&1 | tee compile_wps.log

#####################################BASH Script Finished##############################
echo "Congratulations! You've successfully installed WRF-CHEM 4.4."
echo "Thank you for using this script" 

