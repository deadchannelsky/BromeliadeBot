;sign into bb with specific account
;loginname and password must be passed to sign_in as two parameters.

sign_in(logname,pass)
{
	msgbox, %logname%,%pass%
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
