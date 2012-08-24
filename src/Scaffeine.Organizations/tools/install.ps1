param($installPath, $toolsPath, $package, $project)

add-project $organizationsProjectName | with-reference "System.Configuration,System.Runtime.Serialization,System.Web,$coreProjectName"

get-project | with-reference $organizationsProjectName

scaffold Scaffeine.Organizations