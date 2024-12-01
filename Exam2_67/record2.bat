@echo off
REM Get the current date and time dynamically (handle both / and - as delimiters)

REM Get the current date and check if it uses / or -
for /f "tokens=1-3 delims=/- " %%a in ('date /t') do (
    REM Check if the first token is greater than 12 to determine if it is day or month
    if %%a gtr 12 (
        REM Format as dd-mm-yyyy
        set mydate=%%a-%%b-%%c
    ) else (
        REM Format as mm-dd-yyyy
        set mydate=%%b-%%a-%%c
    )
)

REM Get the current time in format hh-mm (replacing colons with dashes)
for /f "tokens=1-2 delims=: " %%a in ("%TIME%") do (
    set mytime=%%a-%%b
)

REM Remove any leading spaces in time to avoid errors
set mytime=%mytime: =%

REM Determine if OneDrive is being used for the Desktop
set "onedrivePath=C:\Users\takdanai.pr\Documents\CEDT_CLASS\DCL\Exam2_67\Video"
if exist "%onedrivePath%" (
    set "outputFile=%onedrivePath%\%mydate%_%mytime%.mp4"
) else (
    set "outputFile=%USERPROFILE%\Desktop\%mydate%_%mytime%.mp4"
)

REM Echo the output file path for confirmation
echo Output file: %outputFile%

REM Run ffmpeg to capture the desktop with the specified settings
ffmpeg -f gdigrab -r 2 -probesize 40M -threads 1 -i desktop -vcodec libx264 -b:v 256k "%outputFile%"

pause
