@echo off 

REM Install chocolatey
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin" 

REM refresh the env
call refreshenv.cmd

REM accept license automatically
choco feature enable --name allowGlobalConfirmation

REM tools
choco install clink
choco install git
choco install firefox
choco install googlechrome
choco install conemu
choco install firacode
choco install vscode
choco install jdk8
choco install nodejs
choco install tomighty
choco install python3
choco install python2
choco install ruby
choco install racket
choco install jetbrainstoolbox
choco install intellijidea-community 
choco install sumatrapdf
choco install wget
choco install 7zip

REM autohotkey is used to remap caplock to ctrl, without need to logout and log in again.
choco install autohotkey
REM just for fun
choco install youtube-dl
choco install qbittorrent
choco install mpv
choco install hub

REM refresh the env again to make sure  the tools are discoverable in PATH
call refreshenv.cmd

REM install neovim related plugins
npm install --global neovim
gem install neovim
pip install --user neovim
pip3 install --user neovim

REM Install vscode extensions.
REM even though I prefer to use vim (onivim on windows)
code --install-extension formulahendry.code-runner
code --install-extension slevesque.vscode-autohotkey
code --install-extension shaunlebron.vscode-parinfer

