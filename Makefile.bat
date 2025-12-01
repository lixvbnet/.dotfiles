@echo off

@REM echo "Current dir: %cd%"
@REM echo "User home: %userprofile%"
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
echo Done!

PAUSE