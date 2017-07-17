'Author: Valentin DEVILLE

Set shell = WScript.CreateObject("WScript.Shell")
twID = shell.RegRead ("HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\TeamViewer\ClientID")
twVersion = shell.RegRead ("HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\TeamViewer\Version")


Wscript.Echo _
  "<TEAMVIEWER>" & VbCrLf &_
  "<TWID>" & twID & "</TWID>" & VbCrLf &_
  "<VERSION>" & twVersion & "</VERSION>" & VbCrLf &_
  "</TEAMVIEWER>"
