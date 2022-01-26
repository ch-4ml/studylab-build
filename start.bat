@ECHO

CALL stop.bat

git pull

START ./studylab-api.exe

START npx serve -l 3003 -s .