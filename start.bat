@ECHO

CALL stop.bat

START ./studylab-api.exe

START npx serve -l 3000 -s .