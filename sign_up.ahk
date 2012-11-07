#include functions.ahk

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
