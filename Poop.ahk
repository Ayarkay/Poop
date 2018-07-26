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

; /* INIT **************************************************************** */

IfNotExist, %A_WorkingDir%\DataIntegrity.ahk
{
  RepoDI := getHTTP("https://raw.githubusercontent.com/Ayarkay/Poop/master/DataIntegrity.ahk")
  FileAppend, %RepoDI%, %A_WorkingDir%\DataIntegrity.ahk
}
RunWait, %A_WorkingDir%\DataIntegrity.ahk
if (ErrorLevel = 1)
  ExitApp
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
  FileRead, Version, Version.dat
  MsgBox, 0, Poop Info, Version:`t`t%Version%`nCTRL+H:`t`tHelp`nCTRL+P:`t`tPause`nCTRL+Q:`t`tQuit
  return
