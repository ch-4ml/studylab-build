@ECHO

SET FRONT_PORT=3000

SET BACK_PORT=1114

for /f "tokens=5" %%p in ('netstat -aon ^| find /i "listening" ^| find "%FRONT_PORT%"') do taskkill /F /PID %%p

for /f "tokens=5" %%p in ('netstat -aon ^| find /i "listening" ^| find "%BACK_PORT%"') do taskkill /F /PID %%p