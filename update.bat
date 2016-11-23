@echo off
REM cd /d "%~dp0"
:: ========================================
:: ninite location
set ninite=%userprofile%\desktop\programs\ninite.exe
:: folder where you want to move the shortcuts. No quotes or trailing backslash needed.
set folder=%userprofile%\desktop\Programs
:: ========================================

::we run ninite and then wait for it to close
"%ninite%"
REM for /f "skip=1 eol=: delims=" %%F in ('dir /b /o-d "%~dp0*.lnk"') do MOVESOMWHERE "%%F"
:: This would be the windows xp workaround
:: http://stackoverflow.com/questions/17616045/find-files-on-windows-modified-after-a-given-date-using-the-command-line
:: forfiles requires windows vista+
:: https://technet.microsoft.com/en-us/library/cc753551(v=ws.11).aspx
forfiles /p "%public%\Desktop" /M *.lnk /d +%date:~4% >nul 2>nul
if %errorlevel%==1 (
	echo ninite didnt install nayfin neww
	pause
	exit
)
for /f "eol=: delims=" %%F in ('forfiles /p "%public%\Desktop" /M *.lnk /d +%date:~4%') do move %public%\Desktop\%%F "%folder%"
pause 


:: We need to go to the public desktop and then run the dir command otherwise it will list files in your working directory as well
REM cd /d "%public%\desktop"
:: if it fucks up here and says file not found, use ('dir "%public%\desktop" /b /o-d *.lnk 2^>nul') to suppress errors
REM for /f "eol=: delims=" %%F in ('dir "%public%\desktop" /b /o-d *.lnk 2^>nul') do echo "%%F" test
REM move *.lnk test

REM for /f "eol=: delims=" %%F in ('dir /b *.lnk') do echo "%%F" "%folder%\%%F"
REM sometimes it runs twice and fucks up and gives a file not found. 2>nul will suppress those errors
REM dir "%public%\desktop" /b /o-d lnk 2>nul
REM pause