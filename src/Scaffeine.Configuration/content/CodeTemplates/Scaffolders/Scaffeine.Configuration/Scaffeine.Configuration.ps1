[T4Scaffolding.Scaffolder()][CmdletBinding()]
param(        
    [string]$Project,
	[string]$CodeLanguage,
	[string[]]$TemplateFolders,
	[switch]$Force = $false
)

$outputPath = "Configuration\CoreSectionHandler"
Add-Template $coreProjectName $outputPath "CoreSectionHandler" -Force:$Force $TemplateFolders

$outputPath = "Configuration\DevLevel"
Add-Template $coreProjectName $outputPath "DevLevel" -Force:$Force $TemplateFolders

$outputPath = "Configuration\EnvironmentConfiguration"
Add-Template $coreProjectName $outputPath "EnvironmentConfiguration" -Force:$Force $TemplateFolders

$outputPath = "Configuration\SecurityConfiguration"
Add-Template $coreProjectName $outputPath "SecurityConfiguration" -Force:$Force $TemplateFolders

$outputPath = "Configuration\SecurityLevel"
Add-Template $coreProjectName $outputPath "SecurityLevel" -Force:$Force $TemplateFolders

$outputPath = "Configuration\SiteConfiguration"
Add-Template $coreProjectName $outputPath "SiteConfiguration" -Force:$Force $TemplateFolders

$outputPath = "Common\Permissions\PermissionLevel"
Add-Template $coreProjectName $outputPath "PermissionLevel" -Force:$Force $TemplateFolders

$outputPath = "Configuration\ISiteConfiguration"
Add-Template $coreProjectName $outputPath "ISiteConfiguration" -Force:$Force $TemplateFolders

$outputPath = "Configuration\Security"
Add-Template $coreProjectName $outputPath "Security" -Force:$Force $TemplateFolders

$outputPath = "Configuration\Site"
Add-Template $coreProjectName $outputPath "Site" -Force:$Force $TemplateFolders

