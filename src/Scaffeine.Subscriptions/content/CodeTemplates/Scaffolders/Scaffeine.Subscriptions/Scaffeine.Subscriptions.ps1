[T4Scaffolding.Scaffolder()][CmdletBinding()]
param(
    [string]$Project,
	[string]$CodeLanguage,
	[string[]]$TemplateFolders,
	[switch]$Force = $false
)

 $templates = 
 	@("CancelSubscriptionRequest", `
		"CancelSubscriptionResponse", `
		"AccountRequest", `
		"AccountResponse", `
		"SubscriptionsManager", `
		"SubscriptionsProvider", `
		"SubscriptionsProviderCollection", `
		"SubscriptionsSection")

foreach ($tml in $templates){
	$outputPath = $tml
	add-template $subscriptionProjectName $outputPath $tml -Force:$Force $TemplateFolders
}