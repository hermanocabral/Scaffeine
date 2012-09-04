[T4Scaffolding.Scaffolder()][CmdletBinding()]
param(        
    [string]$Project,
	[string]$CodeLanguage,
	[string[]]$TemplateFolders,
	[switch]$Force = $false
)

Add-DomainClass "Model\InboxMessage" "InboxMessage" -Force:$Force $TemplateFolders

scaffold scaffr.ninject.for InboxMessage
