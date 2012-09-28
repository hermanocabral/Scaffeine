namespace $rootnamespace$.Controllers.Account
{
    using System;
    using System.Web;
    using System.Web.Mvc;
    using System.Web.Security;

    using $rootnamespace$.Core.Common.Membership;
    using $rootnamespace$.Core.Model;
    using $rootnamespace$.Models;

    public partial class AccountController
    {
        partial void UserLoggedIn();      

        [AllowAnonymous]
        public ActionResult Logon()
        {
            return this.View();
        }

        [HttpPost]
        [AllowAnonymous]
        public ActionResult Logon(LogOnModel model, string returnUrl)
        {
            if (this.ModelState.IsValid)
            {
                User user;
                AuthenticationStatus status = this._userService.Authenticate(model.UserName, model.Password, out user);

                switch (status)
                {
                    case AuthenticationStatus.Authenticated:

                        _authenticationService.SetAuthCookie(model.UserName, model.RememberMe);

                        string redirectUrl = _authenticationService.GetRedirectUrl(model.UserName, false);
                        
                        return this.Redirect(redirectUrl);

                    case AuthenticationStatus.ResetPassword:

                        _authenticationService.SetAuthCookie(model.UserName, model.RememberMe);
                        
                        this._userService.SaveOrUpdate(user);

                        TempData["Error"] = "Password Change Required";
                        
                        return this.RedirectToAction("ChangePassword", "Account", new { username = model.UserName });
                    default:

                        this.ModelState.AddModelError(string.Empty, "The username or password provided is incorrect");
                        break;
                }
            }

            return this.View(model);
        }

        public ActionResult LogOff()
        {
            this._authenticationService.SignOut();            
            return this.RedirectToAction("Index", "Home");
        }       
    }
}