[T4Scaffolding.Scaffolder(Description = "WC.Payments - Generic Payment Provider")][CmdletBinding()]
param(
    [string]$Project,
	[string]$CodeLanguage,
	[string[]]$TemplateFolders,
	[switch]$Force = $false
)

 $templates = @("Product.Image", "ProductImage")

foreach ($tml in $templates){
	$outputPath = "Model\$tml"
	add-domain $outputPath $tml -Force:$Force $TemplateFolders
}