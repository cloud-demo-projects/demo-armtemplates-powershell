<#
.EXAMPLE
	Invoke-Pester C:\MyData\GithubProjects\demo-armtemplates-powershell\pester\Parameter.Tests.ps1  -OutputFile demo.xml -ParameterPath C:\MyData\GithubProjects\demo-armtemplates-powershell\templates\azuredeploy.json
#>

[CmdLetBinding()]
Param (
	[Parameter(Mandatory=$true)]
	[string] $ParameterPath 
)

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

$parameterFile = Get-Content $ParameterPath -Raw -ErrorAction SilentlyContinue

Describe 'ARM Parameter Validation' {
	Context 'File Validation' {
		It 'Parameter ARM File Exists' {
			Test-Path $ParameterPath -Include '*.json' | Should Be $true
		}

		It 'Is a valid JSON file' {
			$parameterFile | ConvertFrom-Json -ErrorAction SilentlyContinue | Should Not Be $Null
	  }
  }
}