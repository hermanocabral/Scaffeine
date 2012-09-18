﻿using System.Web.Security;

namespace $rootnamespace$.Controllers.Account
{
    using System.Web.Mvc;

    using Core.Common.Membership;
    using Models;

    public partial class AccountController
    {
        public ActionResult ChangePassword(string username)
        {
            return View();
        }

        [HttpPost]
        public ActionResult ChangePassword(ChangePasswordModel model)
        {
            if (ModelState.IsValid)
            {
                var status = _userService.ChangePassword(UserPrincipal.CurrentUser, model.OldPassword, model.NewPassword);

                switch (status)
                {
                    case ChangePasswordStatus.Success:
                        
                        TempData["Success"] = "Password was changed successfully";

                        return Redirect(FormsAuthentication.DefaultUrl);
                        
                    case ChangePasswordStatus.InvalidPassword:
                        ModelState.AddModelError(string.Empty, "The current password is incorrect or the new password is invalid.");
                        break;
                    case ChangePasswordStatus.Failure:
                        ModelState.AddModelError(string.Empty, "An unexpected error occurred.");
                        break;
                }
            }

            ViewBag.PasswordLength = Membership.MinRequiredPasswordLength;
            return View(model);
        }
    }
}
