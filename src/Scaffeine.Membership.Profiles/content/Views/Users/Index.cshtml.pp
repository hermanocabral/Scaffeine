@{
    ViewBag.Title = "Manage Users";
    Layout = "~/Views/Shared/_Folder.cshtml";
}
@model $rootnamespace$.Core.Interfaces.Paging.IPage<$rootnamespace$.Core.Model.User>
<h2>Index</h2>

    
    
<table class="table table-striped">
    <thead>
        <tr>
            <th>Name</th>
            <th>Username</th>
            <th>Last Login</th>
            <th>Approved</th>            
            <th>Is Locked Out</th>
        </tr>
    </thead>
    <tbody>
        @foreach(var user in Model.Entities)
        {
            <tr>
                <td>
                    <a href="@Url.Action("Details", "Users", new { id = user.Id })">@user.FullName</a>    
                </td>
                <td>
                    @user.Username
                </td>
                <td>
                    @user.LastLoginDate.GetValueOrDefault(DateTime.MinValue).ToLocalTime()
                </td>
                <td>
                    @user.IsApproved
                </td>
                
                <td>
                    @user.IsLockedOut
                </td>
            </tr>
        }

    </tbody>
</table>