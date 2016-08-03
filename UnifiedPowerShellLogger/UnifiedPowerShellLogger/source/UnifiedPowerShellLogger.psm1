#requires -version 3.0
<#
	My Function
#>

function Write-GBScreenLog { 
##
## Write a log entry to the screen 
##

Param ( 
	[Parameter( Mandatory=$True, Position=0) ] 
	[string]$Message, 
	[ValidateSet( "OK", "Warning", "Error",   "Info",   "Verbose") ]  
	[string]$Type, 
	[switch]$printTime 
	) 
	
	$screenXpos  =  [Math]::Truncate( $Host. UI. RawUI. WindowSize. Width  -  11)
	#  Write  the  message  to  the  screen
	$now  =  ""
	if( $printTime  -eq  $true) {
		$now  =  ( Get-Date  -Format  "yyyy-MM-dd  HH:mm:ss")
		$now  =  "$now  |  "
	}
    $Message = $now + $Message
    Write-Output $Message
	if( $Type  -ne  "") { 
		[Console]::SetCursorPosition( $screenXpos,   $Host. UI. RawUI. CursorPosition. Y-1)
	}
	switch  ( $Type) {
		"OK"  { Write-Output  -BackgroundColor  Green  -ForegroundColor  Black    "        OK        "}
		"Warning"  { Write-Output  -BackgroundColor  Yellow  -ForegroundColor  Black  "    Warning  "}
		"Error"  { Write-Output  -ForegroundColor  Yellow  -BackgroundColor  Red    "      Error    "}
		"Info"  { Write-Output  -BackgroundColor  $Host. UI. RawUI. ForegroundColor  -ForegroundColor  $Host. UI. RawUI. BackgroundColor  "      Info      "}
		"Verbose" {Write-Output -BackgroundColor $Host.UI.RawUI.ForegroundColor -ForegroundColor $Host.UI.RawUI.BackgroundColor "  Verbose "}
	}
}
  
