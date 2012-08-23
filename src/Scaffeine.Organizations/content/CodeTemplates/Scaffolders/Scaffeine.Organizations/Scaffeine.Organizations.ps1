[T4Scaffolding.Scaffolder(Description = "WC.Payments - Generic Payment Provider")][CmdletBinding()]
param(
    [string]$Project,
	[string]$CodeLanguage,
	[string[]]$TemplateFolders,
	[switch]$Force = $false
)

 $templates = 
 	@("OrganizationsManager", `
		"OrganizationProvider", `
		"OrganizationProviderCollection", `
		"OrganizationsSection")

foreach ($tml in $templates){
	$outputPath = $tml
	add-template $organizationsProjectName $outputPath $tml -Force:$Force $TemplateFolders
}