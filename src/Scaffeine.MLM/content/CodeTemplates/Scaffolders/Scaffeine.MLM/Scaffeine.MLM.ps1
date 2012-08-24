[T4Scaffolding.Scaffolder(Description = "WC.Payments - Generic Payment Provider")][CmdletBinding()]
param(
    [string]$Project,
	[string]$CodeLanguage,
	[string[]]$TemplateFolders,
	[switch]$Force = $false
)

 $templates = 
 	@("MLMProvider")

foreach ($tml in $templates){
	$outputPath = $tml
	add-template $mlmProjectName $outputPath $tml -Force:$Force $TemplateFolders
}