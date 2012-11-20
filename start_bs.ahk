;open BB with a given GUID random or stored. If no GUID is passed to startBB then it will generate one using randguid from functions.ahk 
;#include functions.ahk

start_bs(GUID)
{
  Progress, m2 b fs18 zh0, Starting BlueStacks, , , Courier New
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


