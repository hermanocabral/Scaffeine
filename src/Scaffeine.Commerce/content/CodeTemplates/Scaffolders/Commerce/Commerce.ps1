[T4Scaffolding.Scaffolder()][CmdletBinding()]
param (        
    [string]$Project,
	[string]$CodeLanguage,
	[string[]]$TemplateFolders,
	[switch]$Force = $false
)

Add-DomainClass "Model\Department" "Department" -Force:$Force $TemplateFolders
Add-DomainClass "Model\Category" "Category" -Force:$Force $TemplateFolders

