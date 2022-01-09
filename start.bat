@ECHO

CALL stop.bat

git pull

START ./studylab-api.exe

START npx serve -l client[0] -s .