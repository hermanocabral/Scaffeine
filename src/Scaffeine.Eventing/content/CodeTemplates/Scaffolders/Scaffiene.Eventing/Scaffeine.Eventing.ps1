﻿[T4Scaffolding.Scaffolder(Description = "ScaffR.Architecture - Setup of projects and references in solution.")][CmdletBinding()]
param(        
    [string]$Project,
	[string]$CodeLanguage,
	[string[]]$TemplateFolders,
	[switch]$Force = $false
)


$outputPath = "Configuration\EventLogElement"
Add-Template $coreProjectName $outputPath "EventLogElement" -Force:$Force $TemplateFolders

$outputPath = "Interfaces\Eventing\BootStrapper"
Add-Template $coreProjectName $outputPath "BootStrapper" -Force:$Force $TemplateFolders

$outputPath = "Interfaces\Eventing\Handles"
Add-Template $coreProjectName $outputPath "Handles" -Force:$Force $TemplateFolders

$outputPath = "Interfaces\Eventing\IMessageBus"
Add-Template $coreProjectName $outputPath "IMessageBus" -Force:$Force $TemplateFolders

$outputPath = "Eventing\MessageBus"
Add-Template $coreProjectName $outputPath "MessageBus" -Force:$Force $TemplateFolders