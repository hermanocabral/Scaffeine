[T4Scaffolding.Scaffolder()][CmdletBinding()]
param(        
    [string]$Project,
	[string]$CodeLanguage,
	[string[]]$TemplateFolders,
	[switch]$Force = $false
)

scaffold scaffr.frontend.for User
scaffold scaffr.frontend.for Role
scaffold scaffr.frontend.for UserRole
scaffold scaffr.frontend.for Person
scaffold scaffr.frontend.for UserEmail

Add-CodeToMethod (Get-Project).Name "\" "Global.asax.cs" "MvcApplication" "RegisterGlobalFilters" "filters.Add(new AuthorizeAttribute());"

Add-CodeToMethod $baseProject.Name "\App_Start\" "NinjectWebCommon.cs" "NinjectWebCommon" "RegisterServices" "kernel.Bind<IAuthenticationService>().To<AuthenticationService>().InRequestScope();"


