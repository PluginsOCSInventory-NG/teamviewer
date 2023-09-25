<#
        .SYNOPSIS
        This script retrieves TeamViewer's ClientID and Version from the registry 
        and outputs the result in an XML format.

        .DESCRIPTION
        It considers both 32-bit and 64-bit OS architectures.
#>

$xml = $null

# Declare the registry path
$regPath = ""

# Initialize the registry path based on the architecture 
if(Test-Path "HKLM:\SOFTWARE\WOW6432Node\TeamViewer")
{
    $regPath = "HKLM:\SOFTWARE\WOW6432Node\TeamViewer"
}
if(Test-Path "HKLM:\SOFTWARE\TeamViewer")
{
    $regPath = "HKLM:\SOFTWARE\TeamViewer"
}

if (Test-Path $regPath) 
{
    # Try to get TeamViewer ClientID from the registry
    $teamViewer = (Get-ItemProperty -Path $regPath) | ForEach-Object {
        $xml += "<TEAMVIEWER>`n"
        $xml += "<TWID>"+ $_.Version +"</TWID>`n"
        $xml += "<VERSION>"+ $_.ClientID +"</VERSION>`n"
        $xml += "</TEAMVIEWER>`n"
    }
} 


[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
[Console]::WriteLine($xml)
