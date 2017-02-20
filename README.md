# runscreensaver
Runs given command as screensaver

Created for https://github.com/sinky/html5-screensaver-node-webkit

## Create screensaver executable from .au3 file

- Download AutoIt as ZIP and extract archive (https://www.autoitscript.com/site/autoit/downloads/)
- Run ``Aut2Exe\Aut2exe_x64.exe`` an select the ``runscreensaver.au3`` project file
- Click "Convert"
- Rename ``runscreensaver.exe`` to ``runscreensaver.scr``
- run ``runscreensaver.scr /r``

### Commandline Switches for runscreensaver

```
/c - configure (asks for the command)
/s or none - run screensaver
/p - used to preview inside screensaver system control panel
/r - register this file as screensaver, without need to copy it to Windows dir
```
