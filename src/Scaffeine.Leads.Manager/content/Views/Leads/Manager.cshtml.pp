@{
    ViewBag.Title = "Leads";
    ViewBag.SitemapProvider = "Modules";
    Layout = "~/Views/Shared/_Folder.cshtml";
}
@model $rootnamespace$.Core.Interfaces.Paging.IPage<$rootnamespace$.Core.Model.Lead>


@if (TempData["Success"] != null)
{                
    <div class="alert alert-success">
        @TempData["Success"]
    </div>
}


<table class="table table-bordered">
    
    @if (this.Model.Entities.Any())
    {
        <thead>
            <tr>
                <th>Creation Date</th>
                <th>Source</th>
                <th>Status</th>
                <th></th>
            </tr>
        </thead>
        
        foreach (var customer in Model.Entities)
        {
            <tr>
                <td>@customer.Created</td>            
                <td>@customer.Source</td>
                <td><a href="#">Qualified</a></td>
                <td><a href="@Url.Action("Record", "Leads", new { id = customer.Id })">More Information</a></td>
            </tr>
        }

    }
    else
    {
        <tr>
            <td style="text-align: center">
                <em>There are no leads created yet.  Leads must be created from an external source (See the API Information)</em>
            </td>
        </tr>
    }
    

</table>