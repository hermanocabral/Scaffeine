@{
    ViewBag.Title = "_UserWidget";
}
<table class="table">
    <tr>
        <td style="width: 50px">
            <a href="@Url.Action("Index", "User")">
                <img style="width: 50px" src="../../Content/images/rod.PNG" />
            </a>
        </td>
        <td>
            <h4>
                <a href="@Url.Action("Profile", "Account")">Rod Johnson</a></h4>
            <a href="@Url.Action("Profile", "Account")">Edit Profile</a>
        </td>
    </tr>
</table>
