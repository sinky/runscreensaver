; Runscreensaver
; Author: Marco Krage (marco@my-azur.de)
; License: MIT License - https://marco.mit-license.org/
; Description: Runs given command as screensaver

; Read command from registry
$command = RegRead('HKCU\SOFTWARE\Runscreensaver', 'command')

; Debug
;~ MsgBox(0,'', '#' & StringLower(StringLeft($CmdLineRaw,2)) & '#')

; Handle commandline switches
; /c - configure (asks for the command)
; /s or none - run screensaver
; /p - used to preview inside screensaver system control panel
; /r - register this file as screensaver, without need to copy it to Windows dir
Switch StringLower(StringLeft($CmdLineRaw,2))
  case '/c'
    promptCommand()
  case '/s', ''
    runCommand()
  case '/p'
    exit 0
  case '/r'
    registerScreensaver()
EndSwitch

; Prompts the user to enter the command an writes it to registry
func promptCommand()
  $newCommand = InputBox('Command to run', 'Specify a command to run when the screensaver starts', $command, "", 500, 130)
  If @error == 0 Then
	  RegWrite('HKCU\SOFTWARE\Runscreensaver', 'command', 'REG_SZ', $newCommand)
  EndIf
  Exit 0
EndFunc

; Runs the command stored in registry
Func runCommand()
  
  if($command == "") Then
	  promptCommand()
  EndIf
  Run($command, @scriptdir)
  If @error Then
	  MsgBox(0, @ScriptName & " Error", "Error running command: " & @CRLF & $command)
  EndIf
  Exit 0
EndFunc

; add screensaver to registry an open screensaver system control panel
Func registerScreensaver()
  RegWrite('HKCU\Control Panel\Desktop', 'SCRNSAVE.EXE', 'REG_SZ', @ScriptFullPath) ; The exe needs to be renamed to *.scr
  RegWrite('HKCU\Control Panel\Desktop', 'ScreenSaveActive', 'REG_SZ', '1')
  Run('rundll32.exe shell32.dll,Control_RunDLL desk.cpl,,1')
  Exit 0
EndFunc
