<table class="table">
  <tr>
    <td style="width: 50px; border-top: 0">
      <a href="@Url.Action("Photo", "Account")" class="thumbnail">
        <img style="width: 50px" src="@Url.Content(ViewBag.SmallProfileUrl)" class="img-rounded" />
      </a>
    </td>
    <td style="border-top: 0">
      <h4>
        <a href="@Url.Action("Index", "Dashboard")">@ViewBag.FirstName @ViewBag.LastName</a>
      </h4>
      <a href="@Url.Action("Index", "Account")">Edit Profile</a>
    </td>
  </tr>
</table>
