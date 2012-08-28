namespace $rootnamespace$.Controllers.Account
{
    public partial class AccountController
    {
        partial void UserLoggedIn()
        {
            var action = Url.Action("Index", "Dashboard");
            this.Response.Redirect(action);
        }
    }
}
