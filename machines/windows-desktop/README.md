# tips
To run terminal as admin:
- `windows key` + `x`
- select "Terminal (Admin)"

-------------------------------

The following example show how to stop an application from opening at start up:

```batch
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v Discord /f
```

-------------------------------

One way to discover new data to change in Registry Editor is using Git:
- Creates a directory
- Access the directory in the terminal
- `git init`
- Export Registry Editor in the directory
- `git add -A`
- `git commit -m example`
- Change settings
- Export registry editor in the directory
- Use some tool that let you check the git diff

-------------------------------

Configuring **in-memory** RGB light is important because you don't want a software open 24-hours to maintain the correct light (and you want to maintain when changing to Linux).

- Normally the best software to configure in-memory light is from the hardware seller. For example:
  - Corsair: iCUE
  - HyperX: NGENUITY
  - Logitech: LIGHTSYNC RGB
  - GIGABYTE: GIGABYTE Control Center
- If they fail, you can try one of the Linux open source:
  - Piper
  - OpenRGB

# warnings
If the installation doesn't add the environment variable, remember to add manually because powershell and prompt truncate at 1024 characters. So the following has a chance of truncating:

```batch
set PATH=%PATH%;C:\example
```

# pending
Learn to add things to open fast. For example:
- Win + R and write "shell:sendto", these will appear in "Send To >"

-------------------------------

Configure notepad:
- switch to start new session and discard unsaved changes
- disable recent files
- disable copilot

-------------------------------

Configure taskbar:
- unpin copilot
- unpin microsoft store
- unpin microsoft edge
- unpin outlook
- pin brave

-------------------------------

Configure media player:
- disable look up missing album art and artist art online
- disable remember recent media

-------------------------------

Configure default apps:
- set default browser

-------------------------------

Configure start:
- disable show recently added apps
- disable show websites from your browsing history
- disable show recommendations for tips, shortcuts, new apps and more
- disable show account-related notifications
- remove all pins

-------------------------------

Configure keyboard layout:
- Disable shortcut to change keyboard layout
  - Go to "Time & Language"
  - Go to "Typing"
  - Go to "Advanced keyboard settings"
  - Go to "Language bar options"
  - Go to "Advanced Key Settings"
  - Under "Hot keys for input languages"
  - Select "Between input languages"
  - Press "Change Key Sequence"
  - Disable it

-------------------------------

Configure time to stop using `time.windows.com`
- `time.google.com`
