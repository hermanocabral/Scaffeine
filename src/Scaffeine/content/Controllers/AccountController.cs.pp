﻿using System.Web.Mvc;
using System.Web.Security;
using $rootnamespace$.Core.Interfaces.Service;
using $rootnamespace$.Filters;
using $rootnamespace$.Membership.Helpers;
using $rootnamespace$.Models;

namespace $rootnamespace$.Controllers
{
    public partial class AccountController : Controller
    {
        private readonly IUserService _userService;
        private readonly IUserEmailService _userEmailService;

        public AccountController(IUserService userService, IUserEmailService userEmailService)
        {
            _userService = userService;
            _userEmailService = userEmailService;
        }

        [AllowAnonymous]
        public ActionResult ForgotPassword()
        {
            return Login();
        }

        [AllowAnonymous]
        public ActionResult Login()
        {
            if (MembershipHelper.IsAuthenticated)
            {
                FormsAuthentication.RedirectFromLoginPage(MembershipHelper.User.Identity.Name, true);
            }

            return View();
        }

        [HttpPost]
        [AllowAnonymous]
        public ActionResult Login(LogOnModel model, string returnUrl)
        {
            if (ModelState.IsValid)
            {
                var loginStatus = MembershipHelper.Login(model.UserName, model.Password, model.RememberMe);

                if (loginStatus == MembershipHelper.MembershipLoginStatus.Success)
                {
                    FormsAuthentication.SetAuthCookie(model.UserName, model.RememberMe);
                    if (Url.IsLocalUrl(returnUrl) && returnUrl.Length > 1 && returnUrl.StartsWith("/")
                        && !returnUrl.StartsWith("//") && !returnUrl.StartsWith("/\\"))
                    {
                        return Redirect(returnUrl);
                    }
                    return RedirectToAction("Index", "Dashboard");
                }
                ModelState.AddModelError("", "The username or password provided is incorrect");
            }

            // If we got this far, something failed, redisplay form
            return View(model);
        }

        public ActionResult LogOff()
        {
            MembershipHelper.Logout();
            Session.Abandon();
            return RedirectToAction("Index", "Home");
        }

        [AllowAnonymous]
        public ActionResult Register()
        {
            return View();
        }

        [HttpPost]
        [AllowAnonymous]
        public ActionResult Register(RegisterModel model)
        {
            if (ModelState.IsValid)
            {
                // Attempt to register the user
                MembershipCreateStatus createStatus = MembershipHelper.Register(model.UserName, model.Password, model.Email, true, model.FirstName, model.LastName, "member");

                if (createStatus == MembershipCreateStatus.Success)
                {
                    FormsAuthentication.SetAuthCookie(model.UserName, false /* createPersistentCookie */);
                    return RedirectToAction("Index", "Home");
                }
                ModelState.AddModelError("", ErrorCodeToString(createStatus));
            }

            // If we got this far, something failed, redisplay form
            return View(model);
        }

        [LoginAuthorize]
        public ActionResult Settings()
        {
            ViewBag.PasswordLength = System.Web.Security.Membership.MinRequiredPasswordLength;
            return View();
        }

        [LoginAuthorize]
        [HttpPost]
        public ActionResult Settings(ChangePasswordModel model)
        {
            if (ModelState.IsValid)
            {
                var status = MembershipHelper.ChangePassword(model.OldPassword, model.NewPassword);

                if (status)
                {
                    return RedirectToAction("ChangePasswordSuccess");
                }
                ModelState.AddModelError("", "The current password is incorrect or the new password is invalid.");
            }

            // If we got this far, something failed, redisplay form
            ViewBag.PasswordLength = System.Web.Security.Membership.MinRequiredPasswordLength;
            return View(model);
        }

        [LoginAuthorize]
        public ActionResult ChangePasswordSuccess()
        {
            return View();
        }

        private static string ErrorCodeToString(MembershipCreateStatus createStatus)
        {
            // See http://go.microsoft.com/fwlink/?LinkID=177550 for
            // a full list of status codes.
            switch (createStatus)
            {
                case MembershipCreateStatus.DuplicateUserName:
                    return "User name already exists. Please enter a different user name.";

                case MembershipCreateStatus.DuplicateEmail:
                    return "A user name for that e-mail address already exists. Please enter a different e-mail address.";

                case MembershipCreateStatus.InvalidPassword:
                    return "The password provided is invalid. Please enter a valid password value.";

                case MembershipCreateStatus.InvalidEmail:
                    return "The e-mail address provided is invalid. Please check the value and try again.";

                case MembershipCreateStatus.InvalidAnswer:
                    return "The password retrieval answer provided is invalid. Please check the value and try again.";

                case MembershipCreateStatus.InvalidQuestion:
                    return "The password retrieval question provided is invalid. Please check the value and try again.";

                case MembershipCreateStatus.InvalidUserName:
                    return "The user name provided is invalid. Please check the value and try again.";

                case MembershipCreateStatus.ProviderError:
                    return "The authentication provider returned an error. Please verify your entry and try again. If the problem persists, please contact your system administrator.";

                case MembershipCreateStatus.UserRejected:
                    return "The user creation request has been canceled. Please verify your entry and try again. If the problem persists, please contact your system administrator.";

                default:
                    return "An unknown error occurred. Please verify your entry and try again. If the problem persists, please contact your system administrator.";
            }
        }
    }
}