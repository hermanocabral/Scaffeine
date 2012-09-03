param($installPath, $toolsPath, $package, $project)

add-project $inventoryProjectName | with-reference "System.Configuration,System.Runtime.Serialization,System.Web"

get-project | with-reference $inventoryProjectName

scaffold Scaffeine.Inventory