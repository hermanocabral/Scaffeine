[T4Scaffolding.Scaffolder(Description = "Scaffeine.Order - Generic Order Provider")][CmdletBinding()]
param(
    [string]$Project,
	[string]$CodeLanguage,
	[string[]]$TemplateFolders,
	[switch]$Force = $false
)

 $templates = 
 	@(	"Customer", `
		"Lead")

foreach ($tml in $templates){
	$outputPath = "Model\$tml"
	add-domain $outputPath $tml -Force:$Force $TemplateFolders
}