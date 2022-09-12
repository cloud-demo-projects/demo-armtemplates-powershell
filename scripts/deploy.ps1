<#
.DESCRIPTION
    This script will deploy the ARM template

.PARAMETER ResourceGroupName [String]
    Name of the resource group

.PARAMETER Location [String]
    Location of the deloyment

.PARAMETER TemplatePath [String]
    TemplatePath path

.PARAMETER ParameterPath [String]
    ParameterPath path

#>

[CmdletBinding()]
Param (
    [Parameter(Mandatory)]
    [String] $ResourceGroupName,

    [Parameter(Mandatory)]
    [String] $Location,

    [Parameter(Mandatory)]
    [String] $TemplatePath,

    [Parameter(Mandatory)]
    [String] $ParameterPath
)

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest
#. $PSScriptRoot/TODO

function Add-TriggerTemplate {    
    New-AzResourceGroup -Name $ResourceGroupName -Location $Location

    $templateFile = "$TemplatePath/azuredeploy.json"
    $parameterFile = "$ParameterPath/azuredeploy.parameters.dev.json"
    If (!(Test-Path $TemplateFile)) {
        Write-Host "Template file not found"
    }

    $params = @{
        "ResourceGroupName"     = $ResourceGroupName
        "Mode"                  = "Incremental"
        "TemplateFile"          = $templateFile
        "TemplateParameterFile" = $parameterFile
        "location"              = $location
        "ErrorVariable"         = "errorMessages"
    }
    Write-Host "Starting Template Validation.."
    Test-AzResourceGroupDeployment @params -ErrorAction Stop
    Write-Host "Validation Succeded"

    Write-Host "Starting Template Deployment.."
    New-AzResourceGroupDeployment @params -DeploymentDebugLogLevel None
}


Try {
    $templateDeployment = Add-TriggerTemplate
}
Catch {
    Write-Host "Error occured during deployment of $templateDeployment" -BackgroundColor Darkred
    Throw "$($_.Exception.Message)" 
}

