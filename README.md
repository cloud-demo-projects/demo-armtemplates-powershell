[![Build Status](https://dev.azure.com/bahrinipun/demo-armtemplates-powershell/_apis/build/status/cloud-demo-projects.demo-armtemplates-powershell?branchName=master)](https://dev.azure.com/bahrinipun/demo-armtemplates-powershell/_build/latest?definitionId=55&branchName=master)

# Deploy Azure Resource with ARM Templates, Powershell and Azure DevOps with Pester(BDD)
The sample shows how to deploy Azure resources with :
- ARM teamplates used as IaC
- PowerShell scripting 
- Behaviour driver testing(BDD) with Pester module  
- Azure DevOps pipeline

## Prerequisites
Prerequisites are listed down for local development, CICD and Pester usage.

### Local Development
- VS Code
- Extensions
- Powershell Core 7
- Pester module 4.9.0 version

### CICD
- Azure DevOps Account
- Azure Subscription
- Service principle with appropriate rights

### Pester Short Walkthrough
- Describe: group of tests e.g. imagine tests for your parameter file
- Context: a particular test e.g. imagine test for validating a section of parameter file
- It: a test case, while running Invoke-Pester we get a result pass or fail 
