; Change Display Settings Demo...  by Skan 08-Feb-2009
; Credit: [color=indigo]shimanov[/color] www.autohotkey.com/forum/viewtopic.php?t=8355


Gui, +AlwaysOnTop +Owner
Gui, Font, S10, Tahoma
Gui, Add, ComboBox, w200 Simple R10 vEDS gUpdateButton, % EnumDisplaySettings()
Gui, Add, Button, xp+10 y+10] w180 h41 vSetting gChangeSetting
GuiControlGet, EDS
Gui, Show,, %EDS%

UpdateButton:
 GuiControlGet, EDS
 GuiControl,, Setting, Change Display`n%EDS%
Return

ChangeSetting:
 GuiControlGet, EDS
 StringReplace, EDS, EDS, x, % " / "
 Loop, Parse, EDS, /, %A_Space%
  F%A_Index% := RegExReplace( A_LoopField, "[^0-9]" )
 ChangeDisplaySettings( F3, F1, F2, F4 )
 GuiControl,, EDS, % EnumDisplaySettings()
 GuiControlGet, EDS
 Gui, Show,, %EDS%
Return

ChangeDisplaySettings( cD, sW, sH, rR ) {
  VarSetCapacity(dM,156,0), NumPut(156,dM,36)
  DllCall( "EnumDisplaySettings", UInt,0, UInt,-1, UInt,&dM ), NumPut(0x5c0000,dM,40)
  NumPut(cD,dM,104),  NumPut(sW,dM,108),  NumPut(sH,dM,112),  NumPut(rR,dM,120)
  Return DllCall( "ChangeDisplaySettings", UInt,&dM, UInt,0 )
}

EnumDisplaySettings() {
  VarSetCapacity(DM,156,0), NumPut(156,&DM,36, "UShort")
  ,DllCall( "EnumDisplaySettings", UInt,0, UInt,-1, UInt,&DM )
  ,CS:=NumGet(DM,108) "x" NumGet(DM,112) " / " NumGet(DM,104) "bit / " NumGet(DM,120) "Hz"
 Loop
 If DllCall( "EnumDisplaySettings", UInt,0, UInt,A_Index-1, UInt,&DM )
  EDS:=NumGet(DM,108) "x" NumGet(DM,112) " / " NumGet(DM,104) "bit / " NumGet(DM,120) "Hz"
  ,DS.=(!InStr(DS,EDS) ? "|" EDS : "")
  Else Break
 StringReplace, DS, DS, %CS%|, %CS%||, All
Return SubStr(DS,2)
}

GuiClose:
GuiEscape:
 ExitApp