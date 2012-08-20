[T4Scaffolding.Scaffolder(Description = "Scaffeine.Subscriptions - Generic Subscriptions Provider")][CmdletBinding()]
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