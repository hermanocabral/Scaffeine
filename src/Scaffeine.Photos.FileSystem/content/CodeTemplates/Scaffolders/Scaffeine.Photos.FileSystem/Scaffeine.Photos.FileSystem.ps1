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
	$outputPath = $tml
	add-template $photosFileSystemProjectName $outputPath $tml -Force:$Force $TemplateFolders
}