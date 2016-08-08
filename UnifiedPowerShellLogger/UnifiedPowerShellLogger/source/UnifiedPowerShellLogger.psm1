#requires -version 3.0
<#
.TOPIC
    about_<subject or module name>

.SHORT DESCRIPTION
    A short, one-line description of the topic contents.

.LONG DESCRIPTION
    A detailed, full description of the subject or purpose of the module.

.EXAMPLES
    Examples of how to use the module or how the subject feature works in practice.

.KEYWORDS
    Terms or titles on which you might expect your users to search for the information in this topic.

.SEE ALSO
    Text-only references for further reading. Hyperlinks cannot work in the Windows PowerShell console. 
#>

function Write-GBScreenLog { 
	Param (
		[Parameter(
			Position=0,
			Mandatory=$True,
			ValueFromPipeline=$true
		)] 
		[string]$Message,

		[ValidateSet("OK", "Warning", "Error", "Info", "Verbose")]
		[string]$Type,

		[switch]$NoTimestamp
	)
	
	$screenXpos = [Math]::Truncate( $Host.UI.RawUI.WindowSize.Width - 10)
	# Write the message to the screen
	$now = ""

	if( $NoTimestamp -ne $true) {
		$now = ( Get-Date -Format "yyyy-MM-dd  HH:mm:ss")
		$now = "$now | "
	}

    $Message = $now + $Message
    Write-Output $Message

	if( $Type -ne "") { 
		[Console]::SetCursorPosition( $screenXpos, $Host.UI.RawUI.CursorPosition.Y-1)
	}

	switch ($Type) {
		"OK" {
			Write-Host -BackgroundColor	Green -ForegroundColor Black "   OK    "
		}
		"Warning" {
			Write-Host -BackgroundColor Yellow -ForegroundColor Black " Warning "
		}
		"Error" {
			Write-Host -ForegroundColor Yellow -BackgroundColor Red "  Error  "
		}
		"Info" {
			Write-Host -BackgroundColor $Host.UI.RawUI.ForegroundColor -ForegroundColor $Host.UI.RawUI.BackgroundColor "  Info   "
		}
		"Verbose"{
			Write-Host -BackgroundColor $Host.UI.RawUI.ForegroundColor -ForegroundColor $Host.UI.RawUI.BackgroundColor " Verbose "
		}
	}
}

### Exporting module members
Export-ModuleMember -Function Write-GBScreenLog
