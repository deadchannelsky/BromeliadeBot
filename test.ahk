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

start_bb()