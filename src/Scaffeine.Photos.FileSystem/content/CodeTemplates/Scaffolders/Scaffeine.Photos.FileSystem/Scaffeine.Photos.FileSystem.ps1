[T4Scaffolding.Scaffolder(Description = "Photos File System Provider")][CmdletBinding()]
param(
    [string]$Project,
	[string]$CodeLanguage,
	[string[]]$TemplateFolders,
	[switch]$Force = $false
)

 $templates = 
 	@("FileSystemProvider")

foreach ($tml in $templates){
	$outputPath = "Providers\$tml"
	add-template $photosProjectName $outputPath $tml -Force:$Force $TemplateFolders
}