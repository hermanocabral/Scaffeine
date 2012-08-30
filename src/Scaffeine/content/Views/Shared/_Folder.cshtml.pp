﻿@using $rootnamespace$.Extensions
@using MvcSiteMapProvider
@using MvcSiteMapProvider.Web.Html
@{
    ViewBag.Title = "_Folder";
    Layout = "~/Views/Shared/_Dashboard.cshtml";    
}
@RenderSection("Stylesheets", false)
@RenderSection("Scripts", false)
<div class="row-fluid">
    <div class="span2">

        @Html.Partial("_UserWidget")

        @RenderSection("UserActions", false)
        @if (!this.IsSectionDefined("UserActions"))
        {
            <div class="folder-actions">
                @Html.Partial("_UserActions")
            </div>            
        }
        <h6>
            My Services</h6>
        @{
            SiteMapProvider provider = SiteMap.Providers[ViewBag.SitemapProvider];
        }
        @Html.MvcSiteMap(provider).Pills(0, true, true, 1)
         @*<h6>
            My Friends</h6>
        <ul>
            <li>asdf</li>
        </ul>*@
    </div>
    <div class="span10" id="mainPanel">
        @Html.Alert()
        @Html.MvcSiteMap((string)ViewBag.SitemapProvider).Breadcrumb()
        <div class="row-fluid">
            @RenderBody()
        </div>
    </div>
</div>
