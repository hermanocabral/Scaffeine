[T4Scaffolding.Scaffolder()][CmdletBinding()]
param(        
    [string]$Project,
	[string]$CodeLanguage,
	[string[]]$TemplateFolders,
	[switch]$Force = $false
)

$outputPath = "Views\Shared\_Layout"
Add-Template $baseProject.Name $outputPath "Layout" -Force $TemplateFolders

