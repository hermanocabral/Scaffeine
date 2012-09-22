[T4Scaffolding.Scaffolder()][CmdletBinding()]
param(        
    [string]$Project,
	[string]$CodeLanguage,
	[string[]]$TemplateFolders,
	[switch]$Force = $false
)

Add-Template $coreProjectName "Model\Friends\InvitationStatus" "InvitationStatus" -Force:$Force $TemplateFolders
Add-Template $coreProjectName "Model\Friends\CreateFriendshipStatus" "CreateFriendshipStatus" -Force:$Force $TemplateFolders

Add-Domain "Model\Friends\FriendshipInvitation" "FriendshipInvitation" -Force:$Force $TemplateFolders
Add-Domain "Model\Friends\Friendship" "Friendship" -Force:$Force $TemplateFolders