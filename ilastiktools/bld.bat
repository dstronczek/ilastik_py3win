REM load toolset info
set TOOLSET_INFO_DIR=%PREFIX%\toolset-info
call "%TOOLSET_INFO_DIR%\common-vars.bat"

mkdir build
cd build

set LIB=%PREFIX%\Library\lib;%PREFIX%\libs;%LIB%

REM cmake .. -G "%CMAKE_GENERATOR%" ^
         REM -DCMAKE_INSTALL_PREFIX="%LIBRARY_PREFIX%" ^
         REM -DCMAKE_PREFIX_PATH="%LIBRARY_PREFIX%" ^
         REM -DVIGRA_INCLUDE_DIR="%LIBRARY_PREFIX%/include" ^
         REM -DWITH_OPENMP=ON

REM cmake .. -G "%CMAKE_GENERATOR%" ^
         REM -DCMAKE_INSTALL_PREFIX="%LIBRARY_PREFIX%" ^
         REM -DCMAKE_PREFIX_PATH="%LIBRARY_PREFIX%" ^
		 REM -DCMAKE_INCLUDE_PATH="%PREFIX%\include;%SP_DIR%\numpy\core\include;%PREFIX%\libs\python35.lib" ^
		 REM -DPYTHON_EXECUTABLE="%PYTHON%" ^
         REM -DVIGRA_INCLUDE_DIR="%LIBRARY_PREFIX%/include" ^
         REM -DWITH_OPENMP=ON

cmake .. -G "%CMAKE_GENERATOR%" ^
         -DCMAKE_INSTALL_PREFIX="%LIBRARY_PREFIX%" ^
         -DCMAKE_PREFIX_PATH="%LIBRARY_PREFIX%" ^
         -DVIGRA_INCLUDE_DIR="%LIBRARY_PREFIX%/include;%PREFIX%\include;%SP_DIR%\numpy\core\include" ^
         -DWITH_OPENMP=ON
if errorlevel 1 exit 1

cmake --build . --target INSTALL --config Release
if errorlevel 1 exit 1
