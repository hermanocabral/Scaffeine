param($installPath, $toolsPath, $package, $project)

add-project $membershipProjectName | `
	with-reference "System.Configuration,System.Web,System.ComponentModel.DataAnnotations,System.Web.Helpers,System.Web.ApplicationServices,$coreProjectName,$dataProjectName,$serviceProjectName"

$baseProject | with-reference "$membershipProjectName"

Scaffold ScaffR.Website
Scaffold ScaffR.Membership
Scaffold ScaffR.Ninject

