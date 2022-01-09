@ECHO

CALL stop.bat

git pull

START ./studylab-api.exe

START npx serve -l PARAM_CLIENT_PORT -s .