namespace $rootnamespace$.Controllers.Account
{
    using System.Web.Mvc;
    using System.Web.Security;

    using $rootnamespace$.Filters;
    using $rootnamespace$.Membership.Helpers;
    using $rootnamespace$.Models;

    public partial class AccountController
    {
        partial void UserLoggedIn();

        [$rootnamespace$.Filters.AllowAnonymous]
        public ActionResult ForgotPassword()
        {
            return this.Logon();
        }

        [$rootnamespace$.Filters.AllowAnonymous]
        public ActionResult Logon()
        {
            if (MembershipHelper.IsAuthenticated)
            {
                FormsAuthentication.RedirectFromLoginPage(MembershipHelper.User.Identity.Name, true);
            }

            return this.View();
        }

        [HttpPost]
        [$rootnamespace$.Filters.AllowAnonymous]
        public ActionResult Logon(LogOnModel model, string returnUrl)
        {
            if (this.ModelState.IsValid)
            {
                var loginStatus = MembershipHelper.Login(model.UserName, model.Password, model.RememberMe);

                if (loginStatus == MembershipHelper.MembershipLoginStatus.Success)
                {
                    FormsAuthentication.SetAuthCookie(model.UserName, model.RememberMe);
                    if (this.Url.IsLocalUrl(returnUrl) && returnUrl.Length > 1 && returnUrl.StartsWith("/")
                        && !returnUrl.StartsWith("//") && !returnUrl.StartsWith("/\\"))
                    {
                        return this.Redirect(returnUrl);
                    }

                    this.UserLoggedIn();
                    return this.RedirectToAction("Index", "Home");
                }

                this.ModelState.AddModelError(string.Empty, "The username or password provided is incorrect");
            }

            // If we got this far, something failed, redisplay form
            return this.View(model);
        }

        public ActionResult LogOff()
        {
            MembershipHelper.Logout();
            this.Session.Abandon();
            return this.RedirectToAction("Index", "Home");
        }       
    }
}