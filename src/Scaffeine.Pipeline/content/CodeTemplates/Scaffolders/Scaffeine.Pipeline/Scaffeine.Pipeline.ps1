[T4Scaffolding.Scaffolder(Description = "WC.Payments - Generic Payment Provider")][CmdletBinding()]
param(
    [string]$Project,
	[string]$CodeLanguage,
	[string[]]$TemplateFolders,
	[switch]$Force = $false
)

 $templates = 
 	@("PipelineConfigurationElement")

foreach ($tml in $templates){
	add-template $coreProjectName "Configuration\Pipeline\$tml" $tml -Force:$Force $TemplateFolders
}

 $templates = 
 	@("Filter", `
		"FilterActivator", `
		"FilterChain", `
		"ICoreProcessor", `
		"IPipelineContext", `
		"PipelineFactory", `
		"PipelineManager")

foreach ($tml in $templates){
	$outputPath = "Infrasctructure\Pipeline\$tml"
	add-template $coreProjectName $outputPath $tml -Force:$Force $TemplateFolders
}