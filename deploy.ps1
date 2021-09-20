
New-AzResourceGroup -Name myResourceGroup -Location "West Europe"

$templateFile = "azuredeploy.json"
$parameterFile="azuredeploy.parameters.dev.json"

New-AzResourceGroupDeployment -Name myTemplate -ResourceGroupName myResourceGroup -TemplateFile $templateFile -TemplateParameterFile $parameterFile