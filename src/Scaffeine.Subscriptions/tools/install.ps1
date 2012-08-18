param($installPath, $toolsPath, $package, $project)

add-project $subscriptionProjectName | with-reference "System.Configuration,System.Runtime.Serialization,System.Web"

get-project | with-reference $subscriptionProjectName

scaffold Scaffeine.Subscriptions