namespace $rootnamespace$.Controllers.Account
{
    using System.Web.Mvc;

    using $rootnamespace$.Core.Common.Membership;
    using $rootnamespace$.Models;

    public partial class AccountController
    {      
        public ActionResult ChangePassword(string username)
        {
            return View();
        }

		public ActionResult Settings()
        {
            this.ViewBag.PasswordLength = System.Web.Security.Membership.MinRequiredPasswordLength;
            return this.View();
        }

        [HttpPost]
        public ActionResult Settings(ChangePasswordModel model)
        {
            if (this.ModelState.IsValid)
            {
                var status = _userService.ChangePassword(UserPrincipal.CurrentUser, model.OldPassword, model.NewPassword);

                switch (status)
                {
                    case ChangePasswordStatus.Success:
                        TempData["Success"] = "Password was changed successfully";
                        break;
                    case ChangePasswordStatus.Failure:
                        this.ModelState.AddModelError(string.Empty, "The current password is incorrect or the new password is invalid.");
                        break;
                }           
            }

            this.ViewBag.PasswordLength = System.Web.Security.Membership.MinRequiredPasswordLength;
            return this.View(model);
        }
    }
}
