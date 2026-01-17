@echo off
set TARGET=%1

echo "==================================================="
echo "TARGET: %TARGET%"
@REM echo "Current dir: %cd%"
@REM echo "User home: %userprofile%"
echo "==================================================="
@echo "Preparation..."
set dirname=%userprofile%\.config
if not exist "%dirname%" (
    @echo "create directory %dirname%"
    mkdir "%dirname%"
)

echo.
echo.

echo "==================================================="
set filename=.bashrc
@echo "Installing %filename%..."
set link=%userprofile%\%filename%
if exist "%link%" (
    @echo "delete existing."
    del "%link%"
)
mklink "%link%" "%cd%\%filename%"

echo.

set filename=.bashrc.windows.sh
@echo "Installing %filename%..."
set link=%userprofile%\%filename%
if exist "%link%" (
    @echo "delete existing."
    del "%link%"
)
mklink "%link%" "%cd%\%filename%"

echo.

set filename=.bash_profile
@echo "Installing %filename%..."
set link=%userprofile%\%filename%
if exist "%link%" (
    @echo "delete existing."
    del "%link%"
)
mklink "%link%" "%cd%\%filename%"

echo.

set filename=.vimrc
@echo "Installing %filename%..."
set link=%userprofile%\%filename%
if exist "%link%" (
    @echo "delete existing."
    del "%link%"
)
mklink "%link%" "%cd%\%filename%"

echo.

set filename=.tmux.conf
@echo "Installing %filename%..."
set link=%userprofile%\%filename%
if exist "%link%" (
    @echo "delete existing."
    del "%link%"
)
mklink "%link%" "%cd%\%filename%"

echo.


:: Hardcode the path here
set filename=gitconfig
@echo "Installing %filename%..."
set link=D:\Program Files\Git\etc\%filename%
if exist "%link%" (
    @echo "delete existing."
    del "%link%"
)
mklink "%link%" "%cd%\etc\%filename%"


echo.

:: Lazygit config stores in following location in Windows
set dirname=%LOCALAPPDATA%\lazygit
set filename=config.yml
@echo "Installing lazygit %filename%..."
if not exist "%dirname%" (
    @echo "create directory %dirname%"
    mkdir "%dirname%"
)
set link=%dirname%\%filename%
if exist "%link%" (
    @echo "delete existing."
    del "%link%"
)
mklink "%link%" "%cd%\lazygit\%filename%"




echo.
echo Done!

::PAUSE