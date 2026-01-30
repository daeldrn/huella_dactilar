@echo off
echo --- Limpiando y construyendo el proyecto NetBeans ---
cd netbeans_sample
call ant clean jar
if %errorlevel% neq 0 (
    echo Error al construir el proyecto NetBeans. Abortando.
    pause
    exit /b %errorlevel%
)
cd ..

echo --- Preparando directorios para jpackage ---
REM Eliminar y recrear directorios para asegurar una construcción limpia
if exist "exe_build" rmdir /s /q "exe_build"
mkdir "exe_build"
mkdir "exe_build\input"
mkdir "exe_build\resources"
mkdir "exe_build\output"

echo --- Copiando archivos necesarios para jpackage ---
copy "netbeans_sample\dist\FDxSDKPro.jar" "exe_build\input\" /Y
xcopy "netbeans_sample\dist\lib" "exe_build\input\lib\" /E /I /Y
xcopy "jnisgfplib" "exe_build\input\jnisgfplib\" /E /I /Y

echo --- Ejecutando jpackage para generar el ejecutable nativo ---
REM Asegúrate de que jpackage está en tu PATH o especifica la ruta completa
jpackage --input "exe_build\input" ^
         --name "ControlAsistencia" ^
         --main-jar "FDxSDKPro.jar" ^
         --main-class "SecuGen.FDxSDKPro.samples.JSGD" ^
         --type app-image ^
         --dest "exe_build\output" ^
         --java-options "--enable-native-access=ALL-UNNAMED" ^
         --java-options "-Djava.library.path=app/jnisgfplib/x64" ^
         --win-console

if %errorlevel% neq 0 (
    echo Error durante la ejecución de jpackage. Abortando.
    pause
    exit /b %errorlevel%
)

echo --- Copiando la aplicacion generada a ControlAsistencia_Ejecutable ---
REM Eliminar la version anterior para asegurar que todos los archivos nuevos se copien correctamente
if exist "ControlAsistencia_Ejecutable" rmdir /s /q "ControlAsistencia_Ejecutable"
xcopy "exe_build\output\ControlAsistencia" "ControlAsistencia_Ejecutable\" /E /I /Y

if %errorlevel% neq 0 (
    echo Error al copiar la aplicacion a ControlAsistencia_Ejecutable. Abortando.
    pause
    exit /b %errorlevel%
)

echo --- Proceso completado exitosamente. El ejecutable se encuentra en ControlAsistencia_Ejecutable ---
pause