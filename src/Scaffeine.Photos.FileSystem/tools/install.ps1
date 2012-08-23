param($installPath, $toolsPath, $package, $project)

add-project $photosFileSystemProjectName | with-reference "System.Configuration,System.Runtime.Serialization,System.Web,System.Drawing,$photosProjectName"

get-project | with-reference $photosFileSystemProjectName

scaffold Scaffeine.Photos.FileSystem