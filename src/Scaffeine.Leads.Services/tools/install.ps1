param($installPath, $toolsPath, $package, $project)

scaffold scaffeine.leads.services

build-project

scaffold scaffr.backend.for Lead

add-migration "Leads Added" -projectName $dataProjectName

update-database -projectName $dataProjectName
