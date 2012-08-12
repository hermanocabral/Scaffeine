[T4Scaffolding.Scaffolder(Description = "Payments.AuthNet - Builds the classes for the Authorize.Net payment provider")][CmdletBinding()]
param(        
    [string]$Project,
	[string]$CodeLanguage,
	[string[]]$TemplateFolders,
	[switch]$Force = $false
)

foreach ($tml in @("AuthNetProvider", "Authentication", "AuthorizeNetRequest", "AuthorizeNetResponse", "AuthorizeNetTestMode", "AuthType", "Card", "Customer", "Merchant", "Product", "Ship", "Transaction")){
	$outputPath = $tml
	add-template $authNetProjectName $outputPath $tml -Force:$force $TemplateFolders
}