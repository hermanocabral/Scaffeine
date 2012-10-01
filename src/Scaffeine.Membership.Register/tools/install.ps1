param($installPath, $toolsPath, $package, $project)

Write-Host Registering service RegisterModel to autoMapper -ForegroundColor DarkGreen
Add-CodeToMethod $baseProject.Name "\App_Start\" "AutoMapperConfig.cs" "AutoMapperConfig" "RegisterMappings" "AutoMapper.Mapper.CreateMap<RegisterModel, User>();"