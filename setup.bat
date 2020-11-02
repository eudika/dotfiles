setlocal
set here=%~dp0

rem Create link to Neovim config
mklink /D %LOCALAPPDATA%\nvim %here%home\.config\nvim

rem Create other links here...


endlocal
pause
