@echo off
REM cd /d "%~dp0"

:: ninite location
REM ninite=ninite.exe
:: install folder
REM folder=

::we run ninite and then wait for it to close
REM ninite.exe
REM for /f "skip=1 eol=: delims=" %%F in ('dir /b /o-d "%~dp0*.lnk"') do MOVESOMWHERE "%%F"
REM forfiles /p "%public%\desktop" /d +%date:~4%

:: We need to go to the public desktop and then run the dir command otherwise it will list files in your working directory as well
cd /d "%public%\desktop"
:: if it fucks up here and says file not found, use ('dir "%public%\desktop" /b /o-d *.lnk 2^>nul') to suppress errors
REM for /f "eol=: delims=" %%F in ('dir "%public%\desktop" /b /o-d *.lnk 2^>nul') do move "%%F" test
for /f "eol=: delims=" %%F in ('dir /b *.lnk') do echo "%%F" %folder%
REM sometimes it runs twice and fucks up and gives a file not found. 2>nul will suppress those errors
REM dir "%public%\desktop" /b /o-d lnk 2>nul
pause