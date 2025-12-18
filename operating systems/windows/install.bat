:: not a secret
set USERNAME=thiagola92
set EMAIL=thiagola92@gmail.com

:: use the following commands to discover your SID (Security Identifier) and set it.
:: whoami /user
set SID="S-1-5-21-3042928129-3283668424-2952786783-1000"

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: REFERENCES
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:: to run terminal as admin:
:: - win + X
:: - select "Terminal (Admin)"

:: if the installation doesn't add the environment variable, remember to do manually
:: because powershell and prompt truncate the replacement at 1024 characters.
:: do not use command for setting environment variable from powershell into prompt,
:: it doesn't replace variables when doing something like $examples.

:: TODO: learn to add things to open fast
:: Win + R and write "shell:sendto", these will appear in "Send To >"

:: the following example show how to stop an application from opening at start up:
:: reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v Discord /f

:: how to discover new data to change in registry editor?
:: - creates a folder
:: - "git init" inside the folder
:: - export registry editor in the folder
:: - "git add -A"
:: - "git commit -m example"
:: - change settings
:: - export registry editor in the folder
:: - use some tool that let you check the git diff

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: OS SETTINGS 1
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:: show hidden files
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Hidden /t REG_DWORD /d 1 /f

:: show files extensions
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v HideFileExt /t REG_DWORD /d 0 /f

:: hide recents open files in explorer
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v ShowRecent /t REG_DWORD /d 0 /f

:: switch layout from start
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Start_Layout /t REG_DWORD /d 1 /f

:: disable recent opened items in start, jump lists, file explorer
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Start_TrackDocs /t REG_DWORD /d 0 /f

:: disable recently added apps
reg add "HKEY_USERS\%SID%\Software\Microsoft\Windows\CurrentVersion\Start" /v ShowRecentList /t REG_DWORD /d 0 /f

:: mouse sensitivity
reg add "HKCU\Control Panel\Mouse" /v MouseSensitivity /t REG_SZ /d 5 /f

:: mouse acceleration
reg add "HKCU\Control Panel\Mouse" /v MouseSpeed /t REG_SZ /d 0 /f

:: disable widgets (internal name is dashboard)
reg add "HKLM\Software\Policies\Microsoft\Dsh" /v AllowNewsAndInterests /t REG_DWORD /d 0 /f

:: disable sticky keys (pressing shift key 5x)
reg add "HKCU\Control Panel\Accessibility\StickyKeys" /v Flags /t REG_SZ /d 506 /f

:: hide searchbox from taskbar
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v SearchboxTaskbarMode /t REG_DWORD /d 0 /f

:: disable turning off screen.
powercfg /change monitor-timeout-ac 0

:: disable sleep.
powercfg /change standby-timeout-ac 0

:: remove softwares
C:\Windows\System32\OneDriveSetup.exe /uninstall

:: remove microsoft edge from desktop
del "C:\Users\Public\Desktop\Microsoft Edge.lnk"

:: switch wallpaper (TODO: check if rundll32.exe works or if it will only change after restarting)
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v WallPaper /t REG_SZ /d C:\windows\web\wallpaper\themea\img20.jpg /f
rundll32.exe user32.dll, UpdatePerUserSystemParameters 1, True

:: uninstall tools
:: (order matter, to avoid string being a substring of other name)
winget uninstall "Microsoft 365 Copilot"
winget uninstall "Copilot"
winget uninstall "Xbox Identity Provider"
winget uninstall "Xbox TCUI"
winget uninstall "Game Speech Window"
winget uninstall "Game Bar"
winget uninstall "Xbox"
winget uninstall "Solitaire & Casual Games"
winget uninstall "Microsoft Bing"
winget uninstall "Microsoft Teams"
winget uninstall "News"
winget uninstall "Outlook for Windows"

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: PROGRAMMING TOOLS
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:: version control
winget install Git.Git
git config --global init.defaultBranch main
git config --global user.name %USERNAME%
git config --global user.email %EMAIL%
git config --global core.editor micro
git config --global credential.helper store
git config --global pull.rebase false
git config --global alias.graph "log --graph"
git config --global alias.clone-all "clone --recurse-submodules"
git config --global alias.pull-all "pull --recurse-submodules"
git config --global alias.clone-blobless "clone --filter=blob:none"
git config --global alias.clone-blobless-all "clone --filter=blob:none --recurse-submodules"

:: text editor
winget install Microsoft.VisualStudioCode

:: ide
winget install Microsoft.VisualStudio.2022.Community

:: sql database gui
winget install beekeeper-studio.beekeeper-studio
del "%userprofile%\Desktop\Beekeeper Studio.lnk"

:: web api client
winget install Bruno.Bruno
del "%userprofile%\Desktop\Bruno.lnk"

:: container
winget install Docker.DockerCLI
winget install Docker.DockerCompose

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: PROGRAMMING LANGUAGES - PYTHON
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:: runtime
winget install Python.Python.3.13

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: PROGRAMMING LANGUAGES - JAVASCRIPT
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:: all-in-one
winget install OpenJS.NodeJS

:: all-in-one
winget install DenoLand.Deno

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: PROGRAMMING LANGUAGES - RUST
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:: all-in-one
winget install Rustlang.Rustup

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: PROGRAMMING LANGUAGES - GO
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:: all-in-one
winget install GoLang.Go

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: PROGRAMMING LANGUAGES - C
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:: all-in-one
:: NOTE: Add "C:\Program Files\LLVM\bin" to path later
winget install LLVM.LLVM

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: TERMINAL TOOLS
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:: text editor
winget install zyedidia.micro

:: shell
winget install nushell

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: GENERIC TOOLS
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:: browser
winget install Brave.Brave
del "%userprofile%\Desktop\Brave.lnk"

:: voice chat
winget install Discord.Discord
del "%userprofile%\Desktop\Discord.lnk"
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v Discord /f

:: torrent
winget install DelugeTeam.Deluge

:: game
winget install Valve.Steam
del "C:\Users\Public\Desktop\Steam.lnk"
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v Steam /f

:: zip
winget install RARLab.WinRar
winget install Giorgiotani.Peazip
del "%userprofile%\Desktop\PeaZip.lnk"

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: AUDIO TOOLS
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:: music player (can't be done as admin)
winget install Spotify.Spotify
del "%userprofile%\Desktop\Spotify.lnk"

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: IMAGE TOOLS
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:: image editor
winget install GIMP.GIMP.3
del "%userprofile%\Desktop\GIMP 3.0.6-1.lnk"

:: image draw
winget install Inkscape.Inkscape
del "C:\Users\Public\Desktop\Inkscape.lnk"

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: VIDEO TOOLS
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:: video player
winget install VideoLAN.VLC
del "C:\Users\Public\Desktop\VLC media player.lnk"

:: video editor
winget install Meltytech.Shotcut

:: video recorder
winget install OBSProject.OBSStudio
del "C:\Users\Public\Desktop\OBS Studio.lnk"

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: IN TESTING
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:: disable recently added apps (does it work internally?)
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Start_TrackProgs /t REG_DWORD /d 0 /f

:: changing any of does settings "value" to 1 helps?
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PolicyManager\default\Start\HideFrequentlyUsedApps" /v value /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PolicyManager\default\Start\HideRecentlyAddedApps" /v value /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PolicyManager\default\Start\HideRecommendedPersonalizedSites" /v value /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PolicyManager\default\Start\HideRecommendedSection" /v value /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PolicyManager\default\Start\ShowOrHideMostUsedApps" /v value /t REG_DWORD /d 1 /f

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: MANUAL
:: finding how to do any of does through terminal would be great
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:: notepad
:: - switch to start new session and discard unsaved changes
:: - disable recent files
:: - disable copilot

:: taskbar
:: - unpin copilot
:: - unpin microsoft store
:: - unpin microsoft edge
:: - unpin outlook
:: - pin brave

:: media player
:: - disable look up missing album art and artist art online
:: - disable remember recent media

:: default apps
:: - set default browser

:: start
:: - disable show websites from your browsing history
:: - disable show recommendations for tips, shortcuts, new apps and more
:: - disable show account-related notifications
:: - remove all pins

:: keyboard
:: - remove others layouts (to avoid changing when pressing ctrl+shift)
