@ECHO OFF

CALL stop.bat

./studylab-api.exe
npx serve -l 3000 -s .