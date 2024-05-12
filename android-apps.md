# Android Apps (WIP)
Make sure that you enabled developer mode:
- *Settings* > *About phone* > *Software information*
- Click multiple times in *Build number*
- Check if there is a *Developer options* in you *Settings* list (last item)

Make sure that you allowed USB debbugging:
- *Settings* > *Developer options*
- Check *USB debugging*
- Allow it

Make sure that you connected you phone to the computer through usb.  
Make sure that you have [adb](https://developer.android.com/tools/adb) installed (`sudo apt install -y adb`).  

**WARNING**:  
- Right now you can only install apps that you have the `.apk` in your computer:  
  - `apk install file.apk`  
- There is no way to get the `.apk` directly from Play Store (trusted source).  
- You can use the shell from android through `adb shell`.  
    - When in shell, the package manager that Android use is `pm` (but doesn't install from Play Store).  
