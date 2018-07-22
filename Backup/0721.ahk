#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
CoordMode Pixel  ; Interprets the coordinates below as relative to the screen rather than the active window.
stop = 0  ; Stop flag for loop



Loop { ; Main loop
		Loop { 
		ImageSearch, FoundX, FoundY, 1482, 900, 1882, 996, MENU.png
		Sleep, 1000
		} Until (ErrorLevel != 1 && ErrorLevel !=2)
		MouseMove, 1682, 948, 35
		Sleep, 1000
		Click
if stop = 1
ExitApp		

		Loop { 
		ImageSearch, FoundX, FoundY, 1642, 316, 1672, 332, LOADING.png
		Sleep, 1000
		} Until (ErrorLevel != 1 && ErrorLevel !=2)
		Send {b}
		Sleep, 100
		Send {1}
if stop = 1
ExitApp

		Loop { 
		ImageSearch, FoundX, FoundY, 1642, 316, 1672, 332, JUMP.png
		Sleep, 1000
		} Until (ErrorLevel != 1 && ErrorLevel !=2)
		Sleep, 10000
		Send {Space}
		Sleep, 2000
		Send {Space}


if stop = 1
ExitApp
		Loop { 
		ImageSearch, FoundX, FoundY, 1706, 1038, 1782, 1057, *5 GOVER.png
		Sleep, 1000
		} Until (ErrorLevel != 1 && ErrorLevel !=2)
		MouseMove, 1800, 1050
		Sleep, 1000
		Click
if stop = 1
ExitApp
}
return

^q::  ; Exit key-command
stop = 1
MsgBox Will terminate after current iteration.
return

/*
ImageSearch, FoundX, FoundY, 1482, 900, 1882, 996, MENU.png
if ErrorLevel = 2
    MsgBox Could not conduct the search.
else if ErrorLevel = 1
    MsgBox Icon could not be found on the screen.
else
    MsgBox Play button found.


ImageSearch, FoundX, FoundY, 1642, 316, 1672, 332, LOADING.png
if ErrorLevel = 2
    MsgBox Could not conduct the search.
else if ErrorLevel = 1
    MsgBox Icon could not be found on the screen.
else
    MsgBox Loading button found.


ImageSearch, FoundX, FoundY, 1642, 316, 1672, 332, JUMP.png
if ErrorLevel = 2
    MsgBox Could not conduct the search.
else if ErrorLevel = 1
    MsgBox Icon could not be found on the screen.
else
    MsgBox Jump button found.


ImageSearch, FoundX, FoundY, 1697, 1026, 1915, 1075, *5 GOVER.png
if ErrorLevel = 2
    MsgBox Could not conduct the search.
else if ErrorLevel = 1
    MsgBox Icon could not be found on the screen.
else
    MsgBox Game-Over button found.
*/
