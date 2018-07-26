; /* FLAGS *************************************************************** */

; #Warn
#NoEnv
SendMode Event
SetWorkingDir %A_ScriptDir%

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
FileDelete, %A_WorkingDir%\*.png
IfNotExist, %A_WorkingDir%\IMG\
  FileCreateDir, IMG
IfNotExist, %A_WorkingDir%\IMG\ALMOSTREADY.png
  UrlDownloadToFile, https://raw.githubusercontent.com/Ayarkay/Poop/master/ALMOSTREADY.png, %A_WorkingDir%\IMG\ALMOSTREADY.png
IfNotExist, %A_WorkingDir%\IMG\GOVER.png
  UrlDownloadToFile, https://raw.githubusercontent.com/Ayarkay/Poop/master/GOVER.png, %A_WorkingDir%\IMG\GOVER.png
IfNotExist, %A_WorkingDir%\IMG\JUMP.png
  UrlDownloadToFile, https://raw.githubusercontent.com/Ayarkay/Poop/master/JUMP.png, %A_WorkingDir%\IMG\JUMP.png
IfNotExist, %A_WorkingDir%\IMG\LOADING.png
  UrlDownloadToFile, https://raw.githubusercontent.com/Ayarkay/Poop/master/LOADING.png, %A_WorkingDir%\IMG\LOADING.png
IfNotExist, %A_WorkingDir%\IMG\MENU.png
  UrlDownloadToFile, https://raw.githubusercontent.com/Ayarkay/Poop/master/MENU.png, %A_WorkingDir%\IMG\MENU.png
IfNotExist, %A_WorkingDir%\IMG\REWARD.png
  UrlDownloadToFile, https://raw.githubusercontent.com/Ayarkay/Poop/master/REWARD.png, %A_WorkingDir%\IMG\REWARD.png
IfNotExist, %A_WorkingDir%\IMG\NEWS.png
  UrlDownloadToFile, https://raw.githubusercontent.com/Ayarkay/Poop/master/NEWS.png, %A_WorkingDir%\IMG\REWARD.png
*/


ExitApp
return