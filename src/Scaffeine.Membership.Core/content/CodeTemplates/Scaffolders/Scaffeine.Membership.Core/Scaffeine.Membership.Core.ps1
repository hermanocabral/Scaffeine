[T4Scaffolding.Scaffolder()][CmdletBinding()]
param(        
    [string]$Project,
	[string]$CodeLanguage,
	[string[]]$TemplateFolders,
	[switch]$Force = $false
)

Add-Template $coreProjectName "Model\User.Membership" "User.Membership" -Force:$Force $TemplateFolders

Add-Domain "Model\Role" "Role" -Force:$Force $TemplateFolders
Add-Domain "Model\UserRole" "UserRole" -Force:$Force $TemplateFolders
Add-Domain "Model\UserEmail" "UserEmail" -Force:$Force $TemplateFolders

Add-Template $coreProjectName "Common\Membership\Events\UserCreated" "UserCreated" -Force:$Force $TemplateFolders

