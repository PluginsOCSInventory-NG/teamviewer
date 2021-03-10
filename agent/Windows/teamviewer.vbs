'----------------------------------------------------------
' Plugin for OCS Inventory NG 2.x
' Script :		Retrieve Teamviewer ID and version
' Version :		2.00
' Date :		22/07/2017
' Authors :		Valentin DEVILLE and Stéphane PAUTREL (acb78.com)
'----------------------------------------------------------
' OS checked [X] on	32b	64b	(Professionnal edition)
'	Windows XP	[X]
'	Windows Vista	[X]	[X]
'	Windows 7	[X]	[X]
'	Windows 8.1	[X]	[X]	
'	Windows 10	[X]	[X]
'	Windows 2k8R2		[X]
'	Windows 2k12R2		[X]
'	Windows 2k16		[X]
' ---------------------------------------------------------
' NOTE : No checked on Windows 8
' ---------------------------------------------------------
On Error Resume Next

Set shell = WScript.CreateObject("WScript.Shell")
Set objWMIService = GetObject( "winmgmts://./root/cimv2" )
Set colItems = objWMIService.ExecQuery( "SELECT * FROM Win32_Processor", , 48 )

For Each objItem in colItems
	ArchiOS = objItem.AddressWidth
	If ArchiOS = "32" Then
		Wow = ""
	ElseIf ArchiOS = "64" Then
		Wow = "WOW6432Node\"
	End If
Next

stReg = "HKEY_LOCAL_MACHINE\SOFTWARE\" & Wow & "TeamViewer\"
Check = shell.RegRead(stReg)
If Err.Number <> 0 Then Wscript.quit

twID = shell.RegRead (stReg & "ClientID")
twVersion = shell.RegRead (stReg & "Version")

Wscript.Echo _
	"<TEAMVIEWER>" & VbCrLf &_
	"<TWID>" & twID & "</TWID>" & VbCrLf &_
	"<VERSION>" & twVersion & "</VERSION>" & VbCrLf &_
	"</TEAMVIEWER>"
