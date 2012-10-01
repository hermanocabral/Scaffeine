﻿[T4Scaffolding.Scaffolder(Description = "Scaffeine.Order - Generic Order Provider")][CmdletBinding()]
param(
    [string]$Project,
	[string]$CodeLanguage,
	[string[]]$TemplateFolders,
	[switch]$Force = $false
)

 $templates = 
 	@(	"Order", `
		"OrderLineItem", `
		"OrderStatus")

foreach ($tml in $templates){
	$outputPath = "Model\$tml"
	Add-Domain $outputPath $tml -Force:$Force $TemplateFolders
}

 $templates = 
 	@(	"OrderExtensions", `
		"OrderLineItemExtensions")

foreach ($tml in $templates){
	$outputPath = "Common\Ordering\Extensions\$tml"
	Add-Template $coreProjectName $outputPath $tml -Force:$Force $TemplateFolders
}