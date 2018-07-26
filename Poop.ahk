; /*********************************************************************** */
Version = 0.21
/*
Big reorganization update.
*/

; /* FLAGS *************************************************************** */

; #Warn
#NoEnv
SendMode Event
SetWorkingDir %A_ScriptDir%

; /* FUNCTIONS*************************************************************** */

getHTTP(website)
{
  whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
  whr.Open("GET", website, true)
  whr.Send()
  whr.WaitForResponse()
  return whr.ResponseText
}

; /* UPDATE ************************************************************** */
/*
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
    GoTo, FileCheck
    return
  }
}

FileCheck:
IfNotExist, %A_WorkingDir%\ALMOSTREADY.png
  UrlDownloadToFile, https://raw.githubusercontent.com/Ayarkay/Poop/master/ALMOSTREADY.png, ALMOSTREADY.png
IfNotExist, %A_WorkingDir%\GOVER.png
  UrlDownloadToFile, https://raw.githubusercontent.com/Ayarkay/Poop/master/GOVER.png, GOVER.png
IfNotExist, %A_WorkingDir%\JUMP.png
  UrlDownloadToFile, https://raw.githubusercontent.com/Ayarkay/Poop/master/JUMP.png, JUMP.png
IfNotExist, %A_WorkingDir%\LOADING.png
  UrlDownloadToFile, https://raw.githubusercontent.com/Ayarkay/Poop/master/LOADING.png, LOADING.png
IfNotExist, %A_WorkingDir%\MENU.png
  UrlDownloadToFile, https://raw.githubusercontent.com/Ayarkay/Poop/master/MENU.png, MENU.png
IfNotExist, %A_WorkingDir%\REWARD.png
  UrlDownloadToFile, https://raw.githubusercontent.com/Ayarkay/Poop/master/REWARD.png, REWARD.png
*/

IfNotExist, %A_WorkingDir%\DataIntegrity.ahk
{
  RepoDI := getHTTP("https://raw.githubusercontent.com/Ayarkay/Poop/master/DataIntegrity.ahk")
  FileAppend, %RepoDI%, %A_WorkingDir%\DataIntegrity.ahk
}
RunWait, %A_WorkingDir%\DataIntegrity.ahk
if (ErrorLevel = 1)
  ExitApp

; /* INIT **************************************************************** */


MsgBox, 0, Poop, Launching poop.

; /* LOOP **************************************************************** */

Loop {
  IfWinActive, Fortnite
  {
    ImageSearch, X, Y, 1482, 900, 1582, 996, MENU.png
    if (ErrorLevel != 1 && ErrorLevel !=2)
    {
      MouseMove, 1682, 948, 65
      Click
      MouseMove, 1372, 500, 45
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
    ImageSearch, X, Y, 1632, 316, 1682, 332, JUMP.png
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
}
return

; /* KEY-COMMANDS **************************************************************** */

^q::  ;	Exit key-command
  MsgBox, 0, Poop, Terminating poop.
  ExitApp
  return

^p::	; Pause key-command
  Pause
  return

^h::	; Help key-command
  MsgBox, 0, Poop Info, Version:`t`t%Version%`nCTRL+H:`t`tHelp`nCTRL+P:`t`tPause`nCTRL+Q:`t`tQuit
  return