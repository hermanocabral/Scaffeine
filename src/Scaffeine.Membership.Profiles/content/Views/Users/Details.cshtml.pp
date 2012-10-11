@{
    ViewBag.Title = "User Details";
    Layout = "~/Views/Shared/_Folder.cshtml";
}

@model $rootnamespace$.Models.Users.UserViewModel

<h2>@Model.FullName</h2>

<ul class="nav nav-tabs" id="myTab">
  <li class="active"><a href="#details">Details</a></li>
</ul>
 
<div class="tab-content">
    <div class="tab-pane active" id="details">
        @Html.DisplayForModel("Bootstrap/Bootstrap.Table")
    </div>
</div>