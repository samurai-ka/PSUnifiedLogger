#
# Write_HelloWorld.ps1
#
Import-Module .\source\UnifiedPowerShellLogger.psm1

cls

"Hello World - default - Nothing" | Write-GBScreenLog
"Hello World - default - Info" | Write-GBScreenLog -Type Info
"Hello World - default - OK" | Write-GBScreenLog -Type Ok
"Hello World - default - Warning" | Write-GBScreenLog -Type Warning
"Hello World - default - Error" | Write-GBScreenLog -Type Error
"Hello World - default - Verbose" | Write-GBScreenLog -Type Verbose

Write-Host

"Hello World - No timestamp - Nothing" | Write-GBScreenLog -NoTimestamp
"Hello World - No timestamp - Info" | Write-GBScreenLog -NoTimestamp -Type Info
"Hello World - No timestamp - OK" | Write-GBScreenLog -NoTimestamp -Type Ok
"Hello World - No timestamp - Warning" | Write-GBScreenLog -NoTimestamp -Type Warning
"Hello World - No timestamp - Error" | Write-GBScreenLog -NoTimestamp -Type Error
"Hello World - No timestamp - Verbose" | Write-GBScreenLog -NoTimestamp -Type Verbose

Write-Host
