Menu, Tray, Icon, images\bb.ico
#SingleInstance force
#include start_bb.ahk
#include start_bs.ahk
#include sign_up.ahk
#include sign_in.ahk


FileReadLine, guidVar, persGUID.conf, 1
FileReadLine, codeVar, codeGUID.conf, 1
IfNotExist %A_WorkingDir%\images\BBGUI.jpg
    SplashTextOn, 300, 30, !, Downloading image. Please wait...
	URLDownloadToFile http://i.imgur.com/QyVrG.jpg, images\BBGUI.jpg
	SplashTextOff
    
Gui, Color,Gray, Gray
Gui, Font, cBlack
Gui, Add, Picture, x0 y0 w800 h600 , %A_WorkingDir%/images\BBGUI.jpg
Gui, Add, Edit, x212 y92 w45 h25 , Loops
Gui, Add, UpDown, vMyUpDown Range1-100, 1
Gui, Add, Edit,  x291 y92 w65 h25 , Invite ID
Gui, Add, Edit,  x410 y92 w65 h25 , Password
Gui, Add, Edit,  x170 y153 w288 h23 , GUID is: %guidvar%
Gui, Add, Button, gstartLoop x52 y87 w90 h30 , Start Loop
Gui, Add, Button, gstartPersGuid x52 y148 w90 h30 , Start BS with personal GUID
Gui, Add, Button, gTutorial x692 y10 w50 h20 , Tutorial
Gui, Add, Button, gGit x742 y10 w30 h20 , GIT
Gui, Add, Button, glogSelected x22 y560 w100 h30 , Login Selected
Gui, Add, Button, x142 y560 w130 h30 , Login ALL Sequentially
Gui, Add, Button, gsetPersonalGuid x460 y155 w40 h20 , Set
Gui, Add, Button, gsetInviteCode x358 y95 w30 h20 , Set
Gui, Add, Text, x165 y95 w30 h20 ,&Loops ;Loops Text
Gui, Add, Button, x478 y95 w30 h20 , Set ;Password Set
Gui, Add, ListView, x22 y210 w750 h340 , Saved Logins
loop,Read,tracking.csv
	lv_add("",A_LoopReadLine)

; Generated using SmartGUI Creator for SciTE

Gui, Show, w800 h600, BloodBrother Multitool
return

GuiClose:
ExitApp


setPersonalGuid:
InputBox, persGUID, Set Personal GUID, Save GUID, ,,,,,,,
IfExist, persGUID.conf 
	FileDelete, persGUID.conf
FileAppend, %persGUID%, persGUID.conf
ControlSetText, Edit3, Your personal GUID is: %persGUID%


startPersGuid:
start_bs(guidVar)

setInviteCode:
InputBox, codeVar, Set Invite Code, Invite code, ,,,,,,,
IfExist, codeGUID.conf 
	FileDelete, codeGUID.conf
FileAppend, %codeVar%, codeGUID.conf
ControlSetText, Edit2, %codeVar%


startLoop:
guicontrolget, repeatsVar, , edit1
Loop %repeatsVar%
{
	start_bb()
	sign_up()
	;AutoTut()
}

logSelected:
ControlGet, selectedVar, List,Selected,SysListView321, BloodBrother Multitool
guid = 
start_bs(guid)
start_bb()
tempvarpass = 5demayo5demayo ;this is JUST for testing replace with stored pwd
sign_in(selectedVar,tempvarpass)

Git:
 Run, https://github.com/deadchannelsky/BloodBrothersAuto
Return

Tutorial:
 Run, http://www.youtube.com/watch?v=faFG93zlLEQ
Return