<#@ Template Language="C#" HostSpecific="True" #>
<#@ Output Extension="less" #>

<# WriteScriptsFromPath("custom");#>

@import "less/bootstrap.less";
@import "less/responsive.less";

<#+
 
    private void WriteScriptsFromPath(string path){
        var absolutePath = this.Host.ResolvePath(path);   

        var info= System.IO.Directory.GetFiles(absolutePath);
       
        foreach(string x in info) { 
            var idx = x.IndexOf("custom");
            var relativePath = x.Substring(idx, x.Length - (idx));                    
            WriteLine("@import \"" + relativePath.Replace("\\", "/") + "\";");                   
        } 
        
    }

#>