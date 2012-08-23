[T4Scaffolding.Scaffolder(Description = "WC.Payments - Generic Payment Provider")][CmdletBinding()]
param(
    [string]$Project,
	[string]$CodeLanguage,
	[string[]]$TemplateFolders,
	[switch]$Force = $false
)

 $templates = 
 	@("ImageHelper")

foreach ($tml in $templates){
	$outputPath = "Helpers\$tml"
	add-template $photosProjectName $outputPath $tml -Force:$Force $TemplateFolders
}

 $templates = 
 	@("Photo", `
		"PhotoList", `
		"PhotoRequest", `
		"PhotoThumbnail")

foreach ($tml in $templates){
	$outputPath = "Models\$tml"
	add-template $photosProjectName $outputPath $tml -Force:$Force $TemplateFolders
}

 $templates = 
 	@(	"PhotoManager", `
		"PhotoProvider", `
		"PhotoProviderCollection", `
		"PhotoResize", `
		"PhotoResizeCollection", `
		"PhotoResizeSettings", `
		"PhotoSection")

foreach ($tml in $templates){
	$outputPath = $tml
	add-template $photosProjectName $outputPath $tml -Force:$Force $TemplateFolders
}