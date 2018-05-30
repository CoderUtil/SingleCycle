@echo off
rem  Vivado(TM)
rem  compile.bat: a Vivado-generated XSim simulation Script
rem  Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.

set PATH=%XILINX%\lib\%PLATFORM%;%XILINX%\bin\%PLATFORM%;D:/WorkEnvironment/Vivado/SDK/2014.2/bin;D:/WorkEnvironment/Vivado/Vivado/2014.2/ids_lite/ISE/bin/nt64;D:/WorkEnvironment/Vivado/Vivado/2014.2/ids_lite/ISE/lib/nt64;D:/WorkEnvironment/Vivado/Vivado/2014.2/bin;%PATH%
set XILINX_PLANAHEAD=D:/WorkEnvironment/Vivado/Vivado/2014.2

xelab -m64 --debug typical --relax -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot test_behav --prj D:/WorkEnvironment/Vivado/VivadoProject/SingleCycle/SingleCycle.sim/sim_1/behav/test.prj   xil_defaultlib.test   xil_defaultlib.glbl
if errorlevel 1 (
   cmd /c exit /b %errorlevel%
)
