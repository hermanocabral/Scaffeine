[T4Scaffolding.Scaffolder(Description = "WC.Payments - Generic Payment Provider")][CmdletBinding()]
param(
    [string]$Project,
	[string]$CodeLanguage,
	[string[]]$TemplateFolders,
	[switch]$Force = $false
)

 $templates = 
 	@("User.Photo")

foreach ($tml in $templates){
	$outputPath = "Model\$tml"
	add-template $coreProjectName $outputPath $tml -Force:$Force $TemplateFolders
}

Add-CodeToMethod (Get-Project).Name "\" "Global.asax.cs" "MvcApplication" "RegisterGlobalFilters" "filters.Add(new Filters.ProfileAttribute());"