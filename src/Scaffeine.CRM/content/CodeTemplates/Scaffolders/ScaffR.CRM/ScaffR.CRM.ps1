[T4Scaffolding.Scaffolder()][CmdletBinding()]
param(        
    [string]$Project,
	[string]$CodeLanguage,
	[string[]]$TemplateFolders,
	[switch]$Force = $false
)

Add-Template $coreProjectName "Model\Customer" "Customer" -Force:$Force $TemplateFolders

scaffold ScaffR.Backend.For Customer
scaffold ScaffR.Ninject.For Customer	