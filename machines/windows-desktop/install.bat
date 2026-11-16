:: not a secret
set USERNAME=thiagola92
set EMAIL=thiagola92@gmail.com

:: use the following commands to discover your SID (Security Identifier) and set it.
:: whoami /user
set SID=S-1-5-21-465092230-2707531800-1033661536-1000

:: configuration files directory
set CONFIG=..\..\config

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

:: disable notifications from snipping tool (printscreen)
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Microsoft.ScreenSketch_8wekyb3d8bbwe!App" /v Enabled /t REG_DWORD /d 0 /f

:: disable game bar
reg add "HKEY_USERS\%SID%\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications\Microsoft.XboxGamingOverlay_8wekyb3d8bbwe" /v Disabled /t REG_DWORD /d 1 /f
reg add "HKEY_USERS\%SID%\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications\Microsoft.XboxGamingOverlay_8wekyb3d8bbwe" /v DisabledByUser /t REG_DWORD /d 1 /f
reg add "HKEY_USERS\%SID%\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications\Microsoft.XboxGamingOverlay_8wekyb3d8bbwe" /v IgnoreBatterySaver /t REG_DWORD /d 0 /f
reg add "HKEY_USERS\%SID%\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications\Microsoft.XboxGamingOverlay_8wekyb3d8bbwe" /v SleepDisabled /t REG_DWORD /d 1 /f
reg add "HKEY_USERS\%SID%\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications\Microsoft.XboxGamingOverlay_8wekyb3d8bbwe" /v SleepIgnoreBatterySaver /t REG_DWORD /d 0 /f

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
winget uninstall --name "Microsoft 365 Copilot"
winget uninstall --name "Copilot"
winget uninstall --name "Xbox Identity Provider"
winget uninstall --name "Xbox TCUI"
winget uninstall --name "Game Speech Window"
winget uninstall --name "Xbox"
winget uninstall --name "Solitaire & Casual Games"
winget uninstall --name "Microsoft Bing"
winget uninstall --name "Microsoft Teams"
winget uninstall --name "News"
winget uninstall --name "Outlook for Windows"

:: avoid uninstalling
:: "Game Bar": microsoft tries to open every time you open a game (and it fails if is uninstalled)

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: PROGRAMMING TOOLS
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:: version control
:: TODO: fix user.name and user.email
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

:: ide
winget install --id Microsoft.VisualStudio.Community

:: text editor
winget install --id ZedIndustries.Zed

:: web api client
winget install --id Bruno.Bruno
del "%userprofile%\Desktop\Bruno.lnk"

:: container
winget install --id Docker.DockerCLI
winget install --id Docker.DockerCompose

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: PROGRAMMING LANGUAGES - PYTHON
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:: runtime
winget install --id Python.Python.3.15

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: PROGRAMMING LANGUAGES - JAVASCRIPT
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:: all-in-one
winget install --id OpenJS.NodeJS

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: PROGRAMMING LANGUAGES - RUST
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:: all-in-one
winget install --id Rustlang.Rustup

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: PROGRAMMING LANGUAGES - GO
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:: all-in-one
winget install --id GoLang.Go

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: PROGRAMMING LANGUAGES - C
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:: all-in-one
:: NOTE: Add "C:\Program Files\LLVM\bin" to path later
winget install --id LLVM.LLVM

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: TERMINAL TOOLS
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:: text editor
winget install --id zyedidia.micro
if not exist %USERPROFILE%\.config (md .config)
if not exist %USERPROFILE%\.config (move .config %USERPROFILE%)
if not exist %USERPROFILE%\.config\micro (md micro)
if not exist %USERPROFILE%\.config\micro (move micro %USERPROFILE%\.config)
copy %CONFIG%\micro\settings.json %USERPROFILE%\.config\micro

:: shell
winget install --id nushell
if not exist %USERPROFILE%\AppData\Roaming\nushell (md nushell)
if not exist %USERPROFILE%\AppData\Roaming\nushell (move nushell %USERPROFILE%\AppData\Roaming)
copy %CONFIG%\nushell\config.nu %USERPROFILE%\AppData\Roaming\nushell

:: rgb
:: search for your device software, it's the best for doing what you need in that device

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: DATABASE TOOLS
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:: database gui
winget install --id beekeeper-studio.beekeeper-studio
del "%userprofile%\Desktop\Beekeeper Studio.lnk"

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: GENERIC TOOLS
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:: browser
winget install --id Brave.Brave
del "%userprofile%\Desktop\Brave.lnk"

:: voice chat
winget install --id Discord.Discord
del "%userprofile%\Desktop\Discord.lnk"
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v Discord /f

:: torrent
winget install --id DelugeTeam.Deluge

:: game
winget install --id Valve.Steam
del "C:\Users\Public\Desktop\Steam.lnk"
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v Steam /f

:: zip
winget install --id RARLab.WinRar
winget install --id Giorgiotani.Peazip
del "%userprofile%\Desktop\PeaZip.lnk"

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: AUDIO TOOLS
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:: music player (can't be done as admin, how to make only this run as user)
winget install --id Spotify.Spotify
del "%userprofile%\Desktop\Spotify.lnk"

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: IMAGE TOOLS
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:: image editor
winget install --id GIMP.GIMP.3
del "%userprofile%\Desktop\GIMP 3.*.lnk"

:: image draw
winget install --id Inkscape.Inkscape
del "C:\Users\Public\Desktop\Inkscape.lnk"
if not exist %USERPROFILE%\AppData\Roaming\inkscape (md inkscape)
if not exist %USERPROFILE%\AppData\Roaming\inkscape (move inkscape %USERPROFILE%\AppData\Roaming)
if not exist %USERPROFILE%\AppData\Roaming\inkscape\templates (md templates)
if not exist %USERPROFILE%\AppData\Roaming\inkscape\templates (move templates %USERPROFILE%\AppData\Roaming\inkscape)
copy %CONFIG%\inkscape\preferences.xml %USERPROFILE%\AppData\Roaming\inkscape
copy %CONFIG%\inkscape\default.svg %USERPROFILE%\AppData\Roaming\inkscape\templates

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: VIDEO TOOLS
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:: video player
winget install --id VideoLAN.VLC
del "C:\Users\Public\Desktop\VLC media player.lnk"

:: video editor
winget install --id Meltytech.Shotcut

:: video recorder
winget install --id OBSProject.OBSStudio
del "C:\Users\Public\Desktop\OBS Studio.lnk"

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: STYLE
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:: shell prompt
winget install --id Starship.Starship
if not exist %USERPROFILE%\.config (md .config)
if not exist %USERPROFILE%\.config (move .config %USERPROFILE%)
if not exist %USERPROFILE%\.config\starship (md starship)
if not exist %USERPROFILE%\.config\starship (move starship %USERPROFILE%\.config)
copy %CONFIG%\starship\starship.toml %USERPROFILE%\.config\starship

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: IN TESTING
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:: disable recently added apps (does it work internally?)
:: reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Start_TrackProgs /t REG_DWORD /d 0 /f

:: changing any of does settings "value" to 1 helps?
:: reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PolicyManager\default\Start\HideFrequentlyUsedApps" /v value /t REG_DWORD /d 1 /f
:: reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PolicyManager\default\Start\HideRecentlyAddedApps" /v value /t REG_DWORD /d 1 /f
:: reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PolicyManager\default\Start\HideRecommendedPersonalizedSites" /v value /t REG_DWORD /d 1 /f
:: reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PolicyManager\default\Start\HideRecommendedSection" /v value /t REG_DWORD /d 1 /f
:: reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PolicyManager\default\Start\ShowOrHideMostUsedApps" /v value /t REG_DWORD /d 1 /f

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
:: - disable show recently added apps
:: - disable show websites from your browsing history
:: - disable show recommendations for tips, shortcuts, new apps and more
:: - disable show account-related notifications
:: - remove all pins

:: keyboard
:: - disable shortcut to change keyboard layout
::   - Go to "Time & Language"
::   - Go to "Typing"
::   - Go to "Advanced keyboard settings"
::   - Go to "Language bar options"
::   - Go to "Advanced Key Settings"
::   - Under "Hot keys for input languages"
::   - Select "Between input languages"
::   - Press "Change Key Sequence"
::   - Disable it
