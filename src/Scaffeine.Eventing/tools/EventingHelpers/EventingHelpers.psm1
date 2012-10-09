Function Register-EventHandler($instance){	
	Add-CodeToMethod (Get-Project).Name "\App_Start\" "Start.cs" "MvcToolsStart" "PreStart" "MessageBus.Instance.Subscribe($instance);"	
}

Export-ModuleMember -Function *
