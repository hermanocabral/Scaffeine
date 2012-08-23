param($installPath, $toolsPath, $package, $project)

add-project $photosProjectName | with-reference "System.Configuration,System.Runtime.Serialization,System.Web,System.Drawing"

get-project | with-reference $photosProjectName

scaffold Scaffeine.Photos