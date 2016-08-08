# This is the Pester Unit Test file.
#

Describe "Write-GBScreenLog" {
	Context "Function Exists" {
		It "Should Return [string]PesterTest as parameter" {
			Write-GBScreenLog -NoTimestamp -Message "PesterTest" | Should Be "PesterTest"
		}
		It "Should Return [string]PesterTest as piped" {
			"PesterTest" | Write-GBScreenLog -NoTimestamp | Should Be "PesterTest"
		}
		It "Should convert [int]42 into [string]42" {
			Write-GBScreenLog -NoTimestamp -Message 42 | Should Be "42"
		}
		It "Should convert [boolean]true into [string]True" {
			Write-GBScreenLog -NoTimestamp -Message $true | Should Be "True"
		}

	}
}