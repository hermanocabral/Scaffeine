﻿[T4Scaffolding.Scaffolder()][CmdletBinding()]
param(        
    [string]$Project,
	[string]$CodeLanguage,
	[string[]]$TemplateFolders,
	[switch]$Force = $false
)

Add-Template $coreProjectName "Model\Gender" "Gender" -Force:$Force $TemplateFolders

Add-DomainClass "Model\User" "User" -Force:$Force $TemplateFolders
Add-DomainClass "Model\Role" "Role" -Force:$Force $TemplateFolders
Add-DomainClass "Model\UserRole" "UserRole" -Force:$Force $TemplateFolders
Add-DomainClass "Model\UserEmail" "UserEmail" -Force:$Force $TemplateFolders

scaffold scaffr.frontend.for User
Scaffold scaffr.frontend.for Role
scaffold scaffr.frontend.for UserRole
scaffold scaffr.frontend.For UserEmail

Add-Template $membershipProjectName "Providers\CodeFirstMembershipProvider" "CodeFirstMembershipProvider" -Force:$Force $TemplateFolders
Add-Template $membershipProjectName "Providers\CodeFirstRoleProvider" "CodeFirstRoleProvider" -Force:$Force $TemplateFolders
Add-Template $membershipProjectName "Helpers\MembershipHelper" "MembershipHelper" -Force:$Force $TemplateFolders
Add-Template $dataProjectName "Seeders\MembershipDataSeeder" "MembershipDataSeeder" -Force:$Force $TemplateFolders

# this seriously needs to be refactored
# Add-CodeToMethod $baseProject.Name "\App_Start\" "NinjectMVC3.cs" "NinjectMVC3" "RegisterServices" "kernel.Bind<IUserRepository>().To<UserRepository>().InRequestScope();"
# Add-CodeToMethod $baseProject.Name "\App_Start\" "NinjectMVC3.cs" "NinjectMVC3" "RegisterServices" "kernel.Bind<IRoleRepository>().To<RoleRepository>().InRequestScope();"
# Add-CodeToMethod $baseProject.Name "\App_Start\" "NinjectMVC3.cs" "NinjectMVC3" "RegisterServices" "kernel.Bind<IUserRoleRepository>().To<UserRoleRepository>().InRequestScope();"

add-migration "Membership Added" -Project $dataProjectName
update-database -Project $dataProjectName

Add-CodeToMethod (Get-Project $dataProjectName).Name "\Migrations\" "Configuration.cs" "Configuration" "Seed" "new Seeders.MembershipDataSeeder().Seed(context);"
Add-CodeToMethod (Get-Project).Name "\" "Global.asax.cs" "MvcApplication" "RegisterGlobalFilters" "filters.Add(new Filters.LoginAuthorize());"
#update-database -ProjectName $dataProjectName


