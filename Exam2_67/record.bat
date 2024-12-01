For /f "tokens=2-4 delims=/ " %%a in ('date /t') do (set mydate=%%c-%%b-%%a)
For /f "tokens=1-2 delims=/:" %%a in ("%TIME%") do (set mytime=%%a-%%b)
echo "~\Documents\CEDT_CLASS\DCL\Exam2_67\Video\%mydate%_%mytime%.mp4"
ffmpeg -f gdigrab -r 2 -probesize 40M -threads 1 -i desktop -vcodec libx264 -b:v 256k "~\Documents\CEDT_CLASS\DCL\Exam2_67\Video\%mydate%_%mytime%.mp4"
pause