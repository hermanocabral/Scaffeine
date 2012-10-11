﻿@{
    ViewBag.Title = "User Details";
    Layout = "~/Views/Shared/_Folder.cshtml";
}

@using $rootnamespace$.Extensions
@model $rootnamespace$.Models.Users.UserViewModel

<h2>@Model.FullName</h2>


@Html.MvcSiteMap("Modules").Tabs(2,true,false,1)
<div class="tab-content">
    <div class="tab-pane active" id="details">
        @Html.DisplayForModel("Bootstrap/Bootstrap.Table")
    </div>
</div>