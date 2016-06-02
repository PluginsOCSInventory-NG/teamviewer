'Author: Valentin DEVILLE

Set shell = WScript.CreateObject("WScript.Shell")
twID = shell.RegRead ("HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\TeamViewer\ClientID")
twVersion = shell.RegRead ("HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\TeamViewer\Version")


Wscript.Echo "<TEAMVIEWER>"
Wscript.Echo "<TWID>" & twID & "</TWID>"
Wscript.Echo "<VERSION>" & twVersion & "</VERSION>"
Wscript.Echo "</TEAMVIEWER>"