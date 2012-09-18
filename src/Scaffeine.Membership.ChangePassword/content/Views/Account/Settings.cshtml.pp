@{
    ViewBag.Title = "Settings";
    Layout = "~/Views/Shared/_Folder.cshtml";
    ViewBag.SitemapProvider = "Account";
}
@model $rootnamespace$.Models.ChangePasswordModel
<div class="page-header">
    <h1>Change Password</h1>
</div>
<p>
    Use the form below to change your password.
</p>
<p>
    New passwords are required to be a minimum of @Membership.MinRequiredPasswordLength
    characters in length.
</p>
<hr/>
<div class="row-fluid">
    @using (Html.BeginForm("Settings", "Account", FormMethod.Post, new { @class = "form-horizontal" }))
    {
        @Html.ValidationSummary(true, "Password change was unsuccessful. Please correct the errors and try again.", new { @class = "alert alert-block alert-error" })
    
        <div class="control-group">
            <div class="control-label">
                @Html.LabelFor(m => m.OldPassword)
            </div>
            <div class="controls">
                @Html.PasswordFor(m => m.OldPassword)
                @Html.ValidationMessageFor(m => m.OldPassword)
            </div>
        </div>
        <div class="control-group">
            <div class="control-label">
                @Html.LabelFor(m => m.NewPassword)
            </div>
            <div class="controls">
                @Html.PasswordFor(m => m.NewPassword)
                @Html.ValidationMessageFor(m => m.NewPassword)
            </div>
        </div>
        <div class="control-group">
            <div class="control-label">
                @Html.LabelFor(m => m.ConfirmPassword)
            </div>
            <div class="controls">
                @Html.PasswordFor(m => m.ConfirmPassword)
                @Html.ValidationMessageFor(m => m.ConfirmPassword)
            </div>
        </div>
        <div class="form-actions">
            <input type="submit" value="Change Password" class="btn btn-primary" />
        </div>                    
    }
</div>
