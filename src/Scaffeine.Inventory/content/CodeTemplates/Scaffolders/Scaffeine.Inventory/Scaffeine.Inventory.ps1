[T4Scaffolding.Scaffolder(Description = "Scaffeine.Inventory - Generic Inventory Provider")][CmdletBinding()]
param(
    [string]$Project,
	[string]$CodeLanguage,
	[string[]]$TemplateFolders,
	[switch]$Force = $false
)

 $templates = 
 	@(	"InventoryManager", `
		"InventoryProvider", `
		"InventoryProviderCollection", `
		"InventorySection")

foreach ($tml in $templates){
	$outputPath = $tml
	add-template $inventoryProjectName $outputPath $tml -Force:$Force $TemplateFolders
}