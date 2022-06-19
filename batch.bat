:: fchooser.bat
:: launches a folder chooser and outputs choice to the console
:: https://stackoverflow.com/a/15885133/1683264

@echo off
setlocal

set "psCommand="(new-object -COM 'Shell.Application')^
.BrowseForFolder(0,'Dossier contenant tes musiques',0,0).self.path""

for /f "usebackq delims=" %%I in (`powershell %psCommand%`) do set src=%%I

set "psCommand="(new-object -COM 'Shell.Application')^
.BrowseForFolder(0,'Dossier de destination',0,0).self.path""

for /f "usebackq delims=" %%I in (`powershell %psCommand%`) do set dst=%%I

robocopy "%src%" "%dst%" *.* /xx /njh
endlocal