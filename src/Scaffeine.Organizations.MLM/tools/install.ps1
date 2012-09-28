param($installPath, $toolsPath, $package, $project)

add-project $mlmProjectName | with-reference "System.Configuration,System.Runtime.Serialization,System.Web,$coreProjectName,$organizationsProjectName"

get-project | with-reference $mlmProjectName

scaffold Scaffeine.Organizations.MLM