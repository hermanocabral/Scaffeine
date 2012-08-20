param($installPath, $toolsPath, $package, $project)

add-project $recurlyProjectName | with-reference "System.Configuration,System.Runtime.Serialization,System.Web,$subscriptionProjectName"
get-project | with-reference $recurlyProjectName

install-package AutoMapper -ProjectName $recurlyProjectName

scaffold Subscriptions.Recurly