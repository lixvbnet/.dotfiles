@echo off

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

@REM set filename=.bashrc.windows.sh
@REM @echo "Installing %filename%..."
@REM set link=%userprofile%\%filename%
@REM if exist "%link%" (
@REM     @echo "delete existing."
@REM     del "%link%"
@REM )
@REM mklink "%link%" "%cd%\%filename%"

@REM echo.

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
set link=C:\Program Files\Git\etc\%filename%
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

PAUSE