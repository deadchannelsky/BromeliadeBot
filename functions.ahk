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



/*
end function section


*/
