@ECHO

CALL stop.bat

./studylab-api.exe
npx serve -l 3000 -s .