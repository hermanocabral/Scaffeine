[T4Scaffolding.Scaffolder()][CmdletBinding()]
param(        
    [string]$Project,
	[string]$CodeLanguage,
	[string[]]$TemplateFolders,
	[switch]$Force = $false
)

Add-Template $coreProjectName "Model\InvitationStatus" "InvitationStatus" -Force:$Force $TemplateFolders
Add-Template $coreProjectName "Model\CreateFriendshipStatus" "CreateFriendshipStatus" -Force:$Force $TemplateFolders

Add-Template $coreProjectName "Configuration\CoreSection.Friends" "CoreSection.Friends" -Force:$Force $TemplateFolders
Add-Template $coreProjectName "Configuration\FriendshipElement" "FriendshipElement" -Force:$Force $TemplateFolders
Add-Template $coreProjectName "Configuration\FriendshipSettings" "FriendshipSettings" -Force:$Force $TemplateFolders

Add-Domain "Model\Friendship" "Friendship" -Force:$Force $TemplateFolders
Add-Domain "Model\User.Friendship" "User.Friendship" -Force:$Force $TemplateFolders