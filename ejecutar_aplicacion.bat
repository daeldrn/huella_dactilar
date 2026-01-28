@echo off
echo ========================================
echo   Sistema de Control de Asistencia
echo   con Lector de Huellas Digitales
echo ========================================
echo.

REM Determinar arquitectura del sistema (32-bit o 64-bit)
if "%PROCESSOR_ARCHITECTURE%"=="AMD64" (
    set DLL_PATH=%~dp0jnisgfplib\x64
    echo Detectado: Sistema de 64 bits
) else if "%PROCESSOR_ARCHITEW6432%"=="AMD64" (
    set DLL_PATH=%~dp0jnisgfplib\x64
    echo Detectado: Sistema de 64 bits
) else (
    set DLL_PATH=%~dp0jnisgfplib\win32
    echo Detectado: Sistema de 32 bits
)

echo Ruta DLL: %DLL_PATH%
echo.

REM Agregar las DLLs nativas al PATH
set PATH=%DLL_PATH%;%PATH%

REM Cambiar al directorio del JAR
cd /d "%~dp0netbeans_sample\dist"

REM Ejecutar la aplicación
echo Iniciando aplicacion...
echo.

REM Ejecutar con opciones para suprimir warnings en Java 17+
java --enable-native-access=ALL-UNNAMED -jar FDxSDKPro.jar 2>nul

REM Si falla con el flag moderno, intentar sin él (para Java 8-16)
if errorlevel 1 (
    java -jar FDxSDKPro.jar
)

REM Si hay error, mostrar mensaje
if errorlevel 1 (
    echo.
    echo ERROR: No se pudo ejecutar la aplicacion.
    echo Verifique que Java este instalado correctamente.
    echo.
    pause
)
