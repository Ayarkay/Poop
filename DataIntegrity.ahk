; /* FLAGS *************************************************************** */

; #Warn
#NoEnv
SendMode Event
SetWorkingDir %A_ScriptDir%

; /* FUNCTIONS *************************************************************** */
getHTTP(website)
{
  whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
  whr.Open("GET", website, true)
  whr.Send()
  whr.WaitForResponse()
  return whr.ResponseText
}

; /* DATA INTEGRITY ******************************************************* */

IfNotExist, %A_WorkingDir%\Version.dat
  FileAppend, ,%A_WorkingDir%/Version.dat
FileDelete, %A_WorkingDir%\*.png
IfNotExist, %A_WorkingDir%\IMG\
  FileCreateDir, IMG
IfNotExist, %A_WorkingDir%\IMG\ALMOSTREADY.png
  UrlDownloadToFile, https://raw.githubusercontent.com/Ayarkay/Poop/master/IMG/ALMOSTREADY.png, %A_WorkingDir%\IMG\ALMOSTREADY.png
IfNotExist, %A_WorkingDir%\IMG\GOVER.png
  UrlDownloadToFile, https://raw.githubusercontent.com/Ayarkay/Poop/master/IMG/GOVER.png, %A_WorkingDir%\IMG\GOVER.png
IfNotExist, %A_WorkingDir%\IMG\JUMP.png
  UrlDownloadToFile, https://raw.githubusercontent.com/Ayarkay/Poop/master/IMG/JUMP.png, %A_WorkingDir%\IMG\JUMP.png
IfNotExist, %A_WorkingDir%\IMG\LOADING.png
  UrlDownloadToFile, https://raw.githubusercontent.com/Ayarkay/Poop/master/IMG/LOADING.png, %A_WorkingDir%\IMG\LOADING.png
IfNotExist, %A_WorkingDir%\IMG\MENU.png
  UrlDownloadToFile, https://raw.githubusercontent.com/Ayarkay/Poop/master/IMG/MENU.png, %A_WorkingDir%\IMG\MENU.png
IfNotExist, %A_WorkingDir%\IMG\REWARD.png
  UrlDownloadToFile, https://raw.githubusercontent.com/Ayarkay/Poop/master/IMG/REWARD.png, %A_WorkingDir%\IMG\REWARD.png
IfNotExist, %A_WorkingDir%\IMG\NEWS.png
  UrlDownloadToFile, https://raw.githubusercontent.com/Ayarkay/Poop/master/IMG/NEWS.png, %A_WorkingDir%\IMG\NEWS.png

; /* UPDATE ************************************************************** */

RepositoryVersion := getHTTP("https://raw.githubusercontent.com/Ayarkay/Poop/master/Version.dat")
FileReadLine, LocalVersion, Version.dat, 1
if (RepositoryVersion != LocalVersion) 
{
  msgbox, 1, Poop, A new version has been released! Press OK to apply the update, or Cancel to continue with this version.`n`nReason for update: *to be implemented*
  IfMsgBox, OK
  {
    FileDelete, Poop.ahk
    FileDelete, DataIntegrity.ahk
    RepositoryPoop := getHTTP("https://raw.githubusercontent.com/Ayarkay/Poop/master/Poop.ahk")
    FileAppend, %RepositoryPoop%, %A_WorkingDir%\Poop.ahk
    RepositoryDataIntegrity := getHTTP("https://raw.githubusercontent.com/Ayarkay/Poop/master/DataIntegrity.ahk")
    FileAppend, %RepositoryDataIntegrity%, %A_WorkingDir%\DataIntegrity.ahk
    msgbox, 0, Poop, Update applied. Please restart Poop.
    ExitApp
    return
  }
}

/* ******************************************************************************************************************* */

ExitApp

