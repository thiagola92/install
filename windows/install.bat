:: I will improve comments later,
:: right now I'm just learning windows commands

:: To run terminal as admin:
:: - Win + X
:: - Select "Terminal (Admin)"

:: Show hidden files
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Hidden /t REG_DWORD /d 1 /f

:: Show files extensions
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v HideFileExt /t REG_DWORD /d 0 /f

:: Mouse sensitivity
reg add "HKCU\Control Panel\Mouse" /v MouseSensitivity /t REG_SZ /d 5 /f

:: Disable Widgets (internal name Dashboard)
reg add "HKLM\Software\Policies\Microsoft\Dsh" /v AllowNewsAndInterests /t REG_DWORD /d 0 /f

:: Hide Searchbox
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v SearchboxTaskbarMode /t REG_DWORD /d 0 /f

:: No support for changing default apps

:: No support for pin/unpin to/from taskbar

:: Disable startup
:: Note: Not working yet
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run" /v OneDrive /f

:: Install softwares
winget install Brave.Brave
winget install Git.Git
winget install Zoom.Zoom
winget install Discord.Discord
winget install Microsoft.VisualStudioCode
winget install Valve.Steam
winget install Giorgiotani.Peazip
winget install beekeeper-studio.beekeeper-studio
winget install zyedidia.micro
winget install DelugeTeam.Deluge
winget install Spotify.Spotify
winget install GIMP.GIMP.3
winget install Inkscape.Inkscape
winget install VideoLAN.VLC
winget install OBSProject.OBSStudio
winget install Meltytech.Shotcut
winget install Git.Git
winget install Bruno.Bruno
winget install Docker.DockerCLI
winget install Docker.DockerCompose
winget install Python.Python.3.13
winget install OpenJS.NodeJS
winget install DenoLand.Deno
winget install Rustlang.Rustup
winget install GoLang.Go
