﻿[T4Scaffolding.Scaffolder()][CmdletBinding()]
param(        
    [string]$Project,
	[string]$CodeLanguage,
	[string[]]$TemplateFolders,
	[switch]$Force = $false
)

Add-Template $coreProjectName "Model\Product.Catalog" "Product.Category" -Force:$Force $TemplateFolders
Add-Template $coreProjectName "Model\Category.Catalog" "Category.Catalog" -Force:$Force $TemplateFolders
Add-Template $coreProjectName "Model\Category.Product" "Category.Product" -Force:$Force $TemplateFolders
Add-Domain "Model\CategoryFeaturedProduct" "CategoryFeaturedProduct" -Force:$Force $TemplateFolders
