param($installPath, $toolsPath, $package, $project)

get-project $coreProjectName | with-reference 'System.Configuration'

scaffold scaffeine.pipeline