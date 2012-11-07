Gui, Tab, New Invites
Gui, Add, Tab2, x2 y0 w460 h360 , New Invites|Account Maintenance|Configuration
Gui, Tab, Account Maintenance
Gui, Add, Button, x12 y50 w120 h70 , Log into all accounts in tracking.txt
Gui, Add, ListBox, x192 y50 w260 h300 , ListBox
Gui, Add, Button, x12 y150 w120 h60 , Log into Selected Account
Gui, Add, Text, x192 y30 w260 h20 , Tracking File Contents
Gui, Tab, New Invites
Gui, Add, Button, x12 y50 w110 h60 , Loop Invites
Gui, Add, Edit, x182 y70 w150 h40 , Number of loops
Gui, Tab, Configuration
Gui, Add, Edit, x12 y30 w250 h40 , Personal GUID
Gui, Add, Edit, x12 y90 w250 h40 , Personal Invite code
Gui, Add, Button, x12 y170 w120 h40 , Save Config
Gui, Tab, Account Maintenance
Gui, Add, Button, x12 y230 w120 h70 , Open BS with Personal GUID
; Generated using SmartGUI Creator for SciTE
Gui, Show, w461 h361, Untitled GUI
return

GuiClose:
ExitApp