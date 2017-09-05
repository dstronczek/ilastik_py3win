mkdir build
cd build

cmake .. -G "%CMAKE_GENERATOR%" ^
         -DCMAKE_INSTALL_PREFIX="%LIBRARY_PREFIX%" ^
         -DCMAKE_PREFIX_PATH="%LIBRARY_PREFIX%" ^
         -DVIGRA_INCLUDE_DIR="%LIBRARY_PREFIX%/include;%PREFIX%\include;%SP_DIR%\numpy\core\include" ^
         -DWITH_OPENMP=ON
if errorlevel 1 exit 1

cmake --build . --target INSTALL --config Release
if errorlevel 1 exit 1
