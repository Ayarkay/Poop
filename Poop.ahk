; /*********************************************************************** */
Version = 0.1
/*
We needed more poop.
*/


; /* FLAGS / INIT ******************************************************** */

; #Warn
#NoEnv
SendMode Event
SetWorkingDir %A_ScriptDir%

; /* UPDATE ************************************************************** */

; HTTP request to get text from repository's script
whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.Open("GET", "https://raw.githubusercontent.com/Ayarkay/Poop/master/Poop.ahk", true)
whr.Send()
whr.WaitForResponse()
file := whr.ResponseText
; file := SubStr(file, 2, StrLen(file)-1)
FileAppend, %file%, %A_WorkingDir%\update.txt

FileReadLine, updateFileVersion, update.txt, 2
if (updateFileVersion = "Version = " . Version) 
{
  FileDelete, update.txt
} 
else 
{
  FileReadLine, updateReason, update.txt, 4
  msgbox, 1, Poop, A new version has been released! Press OK to apply the update, or Cancel to continue with this version.`n`nReason for update: %updateReason%
  IfMsgBox, OK
  {
    FileCopy, update.txt, Poop.ahk, 1
    FileDelete, update.txt
    msgbox, 0, Poop, Poop will now close.  Please restart it to apply the update!
    ExitApp
    return
  }
  IfMsgBox, Cancel
  {
    FileDelete, update.txt
    GoTo, Updated
    return
  }
}

; /* INIT **************************************************************** */
Updated:

stop = 0
pause = 0

MsgBox, 0, Poop, Launching poop., 

; /* LOOP **************************************************************** */

Loop {
  IfWinActive, Fortnite
  {
    ImageSearch, X, Y, 1482, 900, 1582, 996, MENU.png
    if (ErrorLevel != 1 && ErrorLevel !=2)
    {
      MouseMove, 1682, 948, 65
      Click
    }
    ImageSearch, X, Y, 525, 883, 567, 903, REWARD.png
    if (ErrorLevel != 1 && ErrorLevel != 2)
    {
      MouseMove, 530, 900, 65
      Click
    }
    ImageSearch, X, Y, 1671, 318, 1705, 330, LOADING.png
    if (ErrorLevel != 1 && ErrorLevel != 2)
    {
      Send {b}
      Sleep, 100
      Send {1}
      Sleep, 10000
    }
    ImageSearch, X, Y, 1642, 316, 1672, 332, JUMP.png
    if (ErrorLevel != 1 && ErrorLevel !=2)
    {
      Random, SleepTime, 7000, 17000
      Sleep, SleepTime
      Send {Space}
    }
    ImageSearch, X, Y, 1257, 1038, 1277, 1058, GOVER.png
    if (ErrorLevel != 1 && ErrorLevel !=2)
    {
      MouseMove, 1800, 1050, 65
      Click
    }
  }
  if stop = 1
  {
    MsgBox, 0, Poop, Terminating poop.,
    ExitApp
  }
}
return

; /* KEY-COMMANDS **************************************************************** */

^q::  ;	Exit key-command
  stop = 1
  return

^p::	; Pause key-command
  Pause