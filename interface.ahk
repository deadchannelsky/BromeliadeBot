Menu, Tray, Icon, images\bb.ico
#SingleInstance force
;#include start_bb.ahk
;#include start_bs.ahk
;#include sign_up.ahk
;#include sign_in.ahk


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






















;Functions for BBUtil

/*

This section for defined functions.



*/ 


genericclick()
{
	WinActivate, BlueStacks
CoordMode, Pixel, Relative
mousemove, varx,vary,5
;mouseclick, left

}

fadedgo()
{
	Loop{
	WinActivate, BlueStacks
CoordMode, Pixel, Relative
WinGetPos, ,,bsWidth,bsHeight, BlueStacks,,,,
ImageSearch, varx,vary,0,0,%bswidth%,%bsheight%, *n5 fadedgo.png
if (errorlevel = 0)
{
	mousemove, varx,vary, 10
	mouseclick, left
	sleep 2000
	break
}
}
return
}

go()
{
	;wait for togo
	Loop{
	WinActivate, BlueStacks
CoordMode, Pixel, Relative
WinGetPos, ,,bsWidth,bsHeight, BlueStacks,,,,
ImageSearch, varx,vary,0,0,%bswidth%,%bsheight%, *n100 go.png
if (errorlevel = 0)
{
	mousemove, varx,vary, 10
	mouseclick, left
	sleep 1000
	break
}
}
return
}


ok()
{
;wait for ok on an accept familiar or other single OK button window
Loop
{
	
	WinActivate, BlueStacks
CoordMode, Pixel, Relative
WinGetPos, ,,bsWidth,bsHeight, BlueStacks,,,,
ImageSearch, varx,vary,0,0,%bswidth%,%bsheight%, *n100 ok2.png
if (ErrorLevel = 0)
{
	MouseMove, varx,vary, 5
	mouseclick, left
	sleep 1000
	break
}
else
ImageSearch, varx,vary,0,0,%bswidth%,%bsheight%, *n100 OK.png
if (ErrorLevel = 0)
{
	MouseMove, varx,vary, 5
	mouseclick, left
	sleep 1000
	break
}
else
ImageSearch, varx,vary,0,0,%bswidth%,%bsheight%, *n100 okLANCER.png
if (ErrorLevel = 0)
{
	MouseMove, varx,vary, 5
	mouseclick, left
	sleep 1000
	break
}
else
ImageSearch, varx,vary,0,0,%bswidth%,%bsheight%, *n100 okwagon.png
if (ErrorLevel = 0)
{
	MouseMove, varx,vary, 5
	mouseclick, left
	sleep 1000
	break
}

else
ImageSearch, varx,vary,0,0,%bswidth%,%bsheight%, *n5 okCOFFER.png
if (ErrorLevel = 0)
{
	MouseMove, varx,vary, 5
	mouseclick, left
	sleep 1000
	break
}
}

return	
}

tobattle()
{
	;waitfortobattle
	i = 30
tobattle7:
i--
WinActivate, BlueStacks
CoordMode, Pixel, Relative
WinGetPos, ,,bsWidth,bsHeight, BlueStacks,,,,
ImageSearch, varx,vary,0,0,%bswidth%,%bsheight%, *n5 tobattle.png
if (ErrorLevel = 0)
{
	MouseMove, varx,vary, 5
	mouseclick, left
	sleep 35000
	return
	
}
else if(i >0)
{
	;msgbox again!
	sleep 1500
	gosub tobattle7
}
return
}

use()
{
	i = 30
touse:
i--
WinActivate, BlueStacks
CoordMode, Pixel, Relative
WinGetPos, ,,bsWidth,bsHeight, BlueStacks,,,,
ImageSearch, varx,vary,0,0,%bswidth%,%bsheight%, *n5 use1.png
if (ErrorLevel = 0)
{
	MouseMove, varx,vary, 5
	mouseclick, left
	
	
}
else
{
	msgbox again!
	sleep 1500
	gosub touse
}
return
}

largemouth(cycles = 30)
{
	i = %cycles%
largemouth:
i--
WinActivate, BlueStacks
CoordMode, Pixel, Relative
WinGetPos, ,,bsWidth,bsHeight, BlueStacks,,,,
ImageSearch, varx,vary,0,0,%bswidth%,%bsheight%, *n5 ginasmouth2.png
if (ErrorLevel = 0)
{
	MouseMove, varx,vary, 5
	mouseclick, left
	sleep 1500
	
}
else if(i >0)
{
	
	sleep 1000
	;msgbox ,,,largemouth %i%,
	gosub largemouth
}
return
}

medmouth()
{
medmouth:

WinActivate, BlueStacks
CoordMode, Pixel, Relative
WinGetPos, ,,bsWidth,bsHeight, BlueStacks,,,,
ImageSearch, varx,vary,0,0,%bswidth%,%bsheight%, *n5 ginasmouth.png
if (ErrorLevel = 1)
{
	;msgbox again!
	gosub medmouth
	
}
else
{
	MouseMove, varx,vary, 5
	mouseclick, left
	sleep 1500
}
return
}

smallmouth()
{
	i = 30
smallmouth:
i--
WinActivate, BlueStacks
CoordMode, Pixel, Relative
WinGetPos, ,,bsWidth,bsHeight, BlueStacks,,,,
ImageSearch, varx,vary,0,0,%bswidth%,%bsheight%, *n5 ginasmouth3.png
if (ErrorLevel = 0)
{
MouseMove, varx,vary, 5
	mouseclick, left
	sleep 1500
}
else if(i > 0)
{
	;msgbox again!
	sleep 1500
	gosub smallmouth	
}
return
}

begin()
{
	i = 30
begin:
i--
WinActivate, BlueStacks
CoordMode, Pixel, Relative
WinGetPos, ,,bsWidth,bsHeight, BlueStacks,,,,
ImageSearch, varx,vary,0,0,%bswidth%,%bsheight%, *n5 begin.png
if (ErrorLevel = 0)
{
	MouseMove, varx,vary, 5
	mouseclick, left
	sleep 1500
}
else if(i > 0)
{
	;msgbox again!
	sleep 500
	gosub begin	
}
return
}

lada()
{
lada:

WinActivate, BlueStacks
CoordMode, Pixel, Relative
WinGetPos, ,,bsWidth,bsHeight, BlueStacks,,,,
ImageSearch, varx,vary,0,0,%bswidth%,%bsheight%, *n5 ladatooltip.png
if (ErrorLevel = 1)
{
	;msgbox again!
	gosub lada	
}
else
{
	MouseMove, varx,vary, 5
	mouseclick, left
	sleep 1500
}
return
}

silverpact()
{
	i = 30
	silverpact:
	i--
	WinActivate, BlueStacks
CoordMode, Pixel, Relative
WinGetPos, ,,bsWidth,bsHeight, BlueStacks,,,,
ImageSearch, varx,vary,0,0,%bswidth%,%bsheight%, *n5 silverpact.png
if (ErrorLevel = 0)
{
	MouseMove, varx,vary, 5
	mouseclick, left
	sleep 2000
	mouseclick, left
		
}
else
{
	;msgbox again!
	sleep 500
	gosub silverpact
	}
	return
}

autobutton()
{
	i=30
auto:
i--
WinActivate, BlueStacks
CoordMode, Pixel, Relative
WinGetPos, ,,bsWidth,bsHeight, BlueStacks,,,,
ImageSearch, varx,vary,0,0,%bswidth%,%bsheight%, *n5 auto.png
if (ErrorLevel = 0)
{
	MouseMove, varx,vary, 5
	mouseclick, left
	sleep 1000
	
	
}
else if(i > 0)
{
	;msgbox again!
	sleep 500
	gosub auto
}
return
}

yes()
{
	i = 30
yes:
i--
WinActivate, BlueStacks
CoordMode, Pixel, Relative
WinGetPos, ,,bsWidth,bsHeight, BlueStacks,,,,
ImageSearch, varx,vary,0,0,%bswidth%,%bsheight%, *n100 yes.png
if (ErrorLevel = 0)
{
	MouseMove, varx,vary, 5
	mouseclick, left
	sleep 1500
	
	
}
else if(i >0)
{
	;msgbox again!
	sleep 500
	gosub yes
}
return
}

gen_email(length = 8)
{
   possible = abcdefghijklmnopqrstuvwxyz
   StringLen, max, possible
   if length > %max%
   {
      MsgBox, Length must be smaller then number of possible characters.
      Exit, 40
   }
   Loop
   {
      Random, rand, 1, max
      StringMid, char, possible, rand, 1
      IfNotInString, password, %char%
      {
         password = %password%%char%
         if StrLen(password) >= length
            break
      }
   }
   tempvar = %password%@gmail.com
   clipboard = %tempvar%
   regread, GUID, REG_SZ,HKEY_LOCAL_MACHINE,SOFTWARE\BlueStacks,USER_GUID
   logVar = %tempvar%,%GUID%`n
   FileAppend,%logVar%,tracking.csv
   return tempvar
}

skip()
{
i = 30
skip:
i--
WinActivate, BlueStacks
CoordMode, Pixel, Relative
WinGetPos, ,,bsWidth,bsHeight, BlueStacks,,,,
ImageSearch, varx,vary,0,0,%bswidth%,%bsheight%, *n5 skip.png
if (ErrorLevel = 0)
{
	MouseMove, varx,vary, 5
	mouseclick, left
	sleep 1500
}
else
{
;msgbox again!
	sleep 1500
	gosub skip	
}
return
	
}

goldok()
{
	;wait for togo
	i = 30
goldok:
i--
WinActivate, BlueStacks
CoordMode, Pixel, Relative
WinGetPos, ,,bsWidth,bsHeight, BlueStacks,,,,
ImageSearch, varx,vary,0,0,%bswidth%,%bsheight%, *n5 goldok.png
if (ErrorLevel = 0)
{
	MouseMove, varx,vary, 5
	mouseclick, left
}
else
{
	;msgbox again!
	sleep 1500
	gosub goldok
}
return
}

code()
{
i = 10
code:
i--
WinActivate, BlueStacks
CoordMode, Pixel, Relative
WinGetPos, ,,bsWidth,bsHeight, BlueStacks,,,,
ImageSearch, varx,vary,0,0,%bswidth%,%bsheight%, *n5 code.png
if (ErrorLevel = 0)
{
	MouseMove, varx,vary, 5
	mouseclick, left
		
}
else if( i >0)
{
	;msgbox again!
	sleep 500
	gosub code	
}

FileReadline, code, code.conf,1
send , %code%
i = 10
code2:
i--
WinActivate, BlueStacks
CoordMode, Pixel, Relative
WinGetPos, ,,bsWidth,bsHeight, BlueStacks,,,,
ImageSearch, varx,vary,0,0,%bswidth%,%bsheight%, *n5 send.png
if (ErrorLevel = 0)
{
	MouseMove, varx,vary, 5
	mouseclick, left
	sleep 10000
	
}
else if( i >0)
{
	;msgbox again!
	sleep 500
	gosub code2	
}

return	
}

sel_warlord(cycles)
{
	i = %cycles%
gh:
i--
WinActivate, BlueStacks
CoordMode, Pixel, Relative
WinGetPos, ,,bsWidth,bsHeight, BlueStacks,,,,
ImageSearch, varx,vary,0,0,%bswidth%,%bsheight%, *n5 greenhealer.png


if(errorlevel = 0)
{
MouseMove, %VarX%, %VarY%, 5
MouseClick, Left
return
}
else if (i >0)
{
	sleep 1000
	gosub gh	
}	
return
}

custom_largemouth(cycles)
{

i = %cycles%
largemouthcus:
i--
WinActivate, BlueStacks
CoordMode, Pixel, Relative
WinGetPos, ,,bsWidth,bsHeight, BlueStacks,,,,
ImageSearch, varx,vary,0,0,%bswidth%,%bsheight%, *n5 ginasmouth2.png
if (ErrorLevel = 0)
{
	MouseMove, varx,vary, 5
	mouseclick, left
	;
	
}
else if(i >0)
{
	msgbox,,,cuslargemouth %i%,1
	sleep 1000
	gosub largemouthcus
}
return
}

rand_guid()
{
ComObject := ComObjCreate("Scriptlet.TypeLib")
NewGUID := ComObject.Guid

StringTrimLeft, GUID, NewGUID,1
StringTrimRight, GUID, GUID,3	
	
	return %GUID%
	
}



;sign into bb with specific account
;loginname and password must be passed to sign_in as two parameters.

sign_in(logname,pass)
{
	;msgbox, %logname%,%pass% debugging
;Wait for BB to launch, look for sign in with mobage.
;THis should become a loop

mobname2:
WinActivate, BlueStacks
WinMove, BlueStacks,,0,0,1024,768,
CoordMode, Pixel, Relative
WinGetPos, ,,bsWidth,bsHeight, BlueStacks,,,,
ImageSearch, varx,vary,0,0,%bswidth%,%bsheight%, *n100 images\mobagename.png
if (ErrorLevel = 0)
{	
	MouseMove, varx,vary, 5
	mouseclick, left
}
else
{
	gosub mobname2
}

Loop{
	WinActivate, BlueStacks
	CoordMode, Pixel, Relative
	WinGetPos, ,,bsWidth,bsHeight, BlueStacks,,,,
	ImageSearch, varx,vary,0,0,%bswidth%,%bsheight%, *n100 images\login.png
	if(errorlevel =0)
		{ 
		MouseMove, varx,vary, 5
		mouseclick, left
		break
		}
	}
	
	
	
Loop{
	WinActivate, BlueStacks
	CoordMode, Pixel, Relative
	WinGetPos, ,,bsWidth,bsHeight, BlueStacks,,,,
	ImageSearch, varx,vary,0,0,%bswidth%,%bsheight%, *n100 images\emailfield2.png
	if(errorlevel =0)
		{ 
		MouseMove, varx,vary, 5
		mouseclick, left
		break
		}
	}
	
	send, %logname%
	sleep 1000
	send, {Tab}
	sleep 1000
	send, %pass%
	sleep 1000

	Loop{
	WinActivate, BlueStacks
	CoordMode, Pixel, Relative
	WinGetPos, ,,bsWidth,bsHeight, BlueStacks,,,,
	ImageSearch, varx,vary,0,0,%bswidth%,%bsheight%, *n100 images\login2.png
	if(errorlevel =0)
		{ 
		MouseMove, varx,vary, 5
		mouseclick, left
		return
		}
	}
	/*
	Loop{
	WinActivate, BlueStacks
	CoordMode, Pixel, Relative
	WinGetPos, ,,bsWidth,bsHeight, BlueStacks,,,,
	ImageSearch, varx,vary,0,0,%bswidth%,%bsheight%, *n100 images\yesplay.png
	if(errorlevel =0)
		{ 
		MouseMove, varx,vary, 5
		mouseclick, left
		break
		}
	}
	*/
	return
}

;#include functions.ahk

;required images for singup, 
/*
mobagename.png
emailfield.png
signup.png
saveplay.png
yesplay.png





*/
sign_up()
{

;Wait for BB to launch, look for sign in with mobage.


mobname:
WinActivate, BlueStacks
WinMove, BlueStacks,,0,0,1024,768,
CoordMode, Pixel, Relative
WinGetPos, ,,bsWidth,bsHeight, BlueStacks,,,,
ImageSearch, varx,vary,0,0,%bswidth%,%bsheight%, *n100 mobagename.png
if (ErrorLevel = 0)
{
	
	MouseMove, varx,vary, 5
	mouseclick, left
		
}
else
{
	gosub mobname
}

;wait a fraction then click right on the signup that loads directly under mouse. 
sleep 1500
MouseClick, left



;wait a second for signup form.
sleep 1000


;generate a random email, write it to text file and past it in the email field.
emailField:
WinActivate, BlueStacks
CoordMode, Pixel, Relative
WinGetPos, ,,bsWidth,bsHeight, BlueStacks,,,,
ImageSearch, varx,vary,0,0,%bswidth%,%bsheight%, *n5 emailField.png
if (ErrorLevel = 1)
{
	;msgbox again!
	gosub emailField
	
}
else
{
	MouseMove, varx,vary, 5
	mouseclick, left
}

gen_email()

Send, %clipboard%
sleep 2000
;use password in password field
WinActivate, BlueStacks
send, {Tab}
sleep 2500
send 5demayo5demayo
sleep 2500
;click the signup button
signUp:
WinActivate, BlueStacks
CoordMode, Pixel, Relative
WinGetPos, ,,bsWidth,bsHeight, BlueStacks,,,,
ImageSearch, varx,vary,0,0,%bswidth%,%bsheight%, *n5 signup.png
if (ErrorLevel = 1)
{
	;msgbox again!
	gosub signUp
	
}
else
{
	MouseMove, varx,vary, 5
	mouseclick, left
}
sleep 1500
;click save and play


;click the saveplay button
saveplay:
WinActivate, BlueStacks
CoordMode, Pixel, Relative
WinGetPos, ,,bsWidth,bsHeight, BlueStacks,,,,
ImageSearch, varx,vary,0,0,%bswidth%,%bsheight%, *n5 saveplay.png
if (ErrorLevel = 1)
{
	;msgbox again!
	gosub saveplay
	
}
else
{
	MouseMove, varx,vary, 5
	mouseclick, left
}

;click the yes let me play
i = 100
yesplay:
i--
WinActivate, BlueStacks
CoordMode, Pixel, Relative
WinGetPos, ,,bsWidth,bsHeight, BlueStacks,,,,
ImageSearch, varx,vary,0,0,%bswidth%,%bsheight%, *n100 yesplay.png
if (ErrorLevel = 0)
{
	MouseMove, varx,vary, 5
	mouseclick, left
	
}
 else 
{
	sleep 5000
	;msgbox again!
	gosub yesplay
}
return
}


start_bb()
{

Loop
{
WinMove, BlueStacks,,0,0,1024,768,
WinActivate, BlueStacks
CoordMode, Pixel, Relative
WinGetPos, ,,bsWidth,bsHeight, BlueStacks,,,,
ImageSearch, varx,vary,0,0,%bswidth%,%bsheight%, *n100 bbicon.png
if (ErrorLevel = 0)
{
	MouseMove, varx,vary, 5
	mouseclick, left
	return
}
msgbox ,,,%errorlevel%,1
}

return
}
;open BB with a given GUID random or stored. If no GUID is passed to startBB then it will generate one using randguid from functions.ahk 
;#include functions.ahk

start_bs(GUID)
{
  ;Progress, m2 b fs18 zh0, Starting BlueStacks, , , Courier New
if GUID =
 GUID := rand_guid()
Process, exist, HD-Agent.exe
if(errorlevel >0)
{
 
 process, waitclose, hd-agent.exe,5
}
/*
process, exist, HD-Adb.exe
if (errorlevel >0)
{
  
 process, waitclose, hd-adb.exe,5
}

process, exist, HD-Frontend.exe
if (errorlevel >0)
{
  
 process, waitclose, hd-frontend.exe,5
}

process, exist, HD-runapp.exe
if (errorlevel >0)
{
  
 process, waitclose, hd-runapp.exe,5
 
}
process, exist, HD
if (errorlevel >0)
{
  
 process, waitclose, %errorlevel%,15
}
*/
run taskkill.exe /f /IM HD-Service.exe,, Hide

 RegWrite,REG_SZ,HKEY_LOCAL_MACHINE,SOFTWARE\BlueStacks,USER_GUID,%guid%
 RegDelete,HKEY_LOCAL_MACHINE,SOFTWARE\BlueStacks\Guests\Android\,BootParameters
 RegWrite,REG_SZ,HKEY_LOCAL_MACHINE,SOFTWARE\BlueStacks\Guests\Android,BootParameters,noxsave noxsaveopt root=/dev/sda1 SRC=/android DATA=/dev/sdb1 SDCARD=/dev/sdc1 PREBUNDLEDAPPSFS=/dev/sdd1 GUID=%guid% HOST=WIN  VERSION=0.7.3.2605 armApps=true GlMode=1 OEM=BlueStacks LANG=en_US P2DM=1
 sleep 1000
 ;msgBox, "I wrote %GUID% to Registry and BootParams"
 IfExist, C:\Program Files (x86)
	Run, c:\Program Files (x86)\BlueStacks\HD-StartLauncher.exe
 else 
	Run, C:\Program Files\BlueStacks\HD-StartLauncher.exe
WinMove, BlueStacks,,0,0,1024,768,
return
}





















/*
end function section


*/
