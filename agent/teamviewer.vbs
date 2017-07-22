'----------------------------------------------------------
' Plugin for OCS Inventory NG 2.x
' Script : Retrieve Teamviewer ID and version
' Version : 2.0
' Date : 22/07/2017
' Authors : Valentin DEVILLE & Stéphane PAUTREL
'----------------------------------------------------------
On Error Resume Next

Set shell = WScript.CreateObject("WScript.Shell")
Set objWMIService = GetObject( "winmgmts://./root/cimv2" )
Set colItems = objWMIService.ExecQuery( "SELECT * FROM Win32_Processor", , 48 )

stReg = "HKEY_LOCAL_MACHINE\SOFTWARE\"

For Each objItem in colItems
	ArchiOS = objItem.AddressWidth
	
	If ArchiOS = "32" Then
		Wow = ""
	ElseIf ArchiOS = "64" Then
		Wow = "WOW6432Node\"
	End If
Next

twID = shell.RegRead (stReg & Wow & "TeamViewer\ClientID")
twVersion = shell.RegRead (stReg & Wow & "TeamViewer\Version")

Wscript.Echo _
	"<TEAMVIEWER>" & VbCrLf &_
	"<TWID>" & twID & "</TWID>" & VbCrLf &_
	"<VERSION>" & twVersion & "</VERSION>" & VbCrLf &_
	"</TEAMVIEWER>"