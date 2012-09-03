param($installPath, $toolsPath, $package, $project)

add-project $orderProjectName | with-reference "System.Configuration,System.Runtime.Serialization,System.Web"

get-project | with-reference $orderProjectName

scaffold Scaffeine.Ordering