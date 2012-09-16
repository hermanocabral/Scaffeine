namespace $rootnamespace$.Controllers.Account
{
    using System.Web.Mvc;

    using $rootnamespace$.Core.Common.Membership;
    using $rootnamespace$.Core.Model;
    using $rootnamespace$.Models;

    public partial class AccountController
    {
        [AllowAnonymous]
        public ActionResult Register()
        {
            return this.View();
        }

        [HttpPost]
        [AllowAnonymous]
        public ActionResult Register(RegisterModel model)
        {
            if (this.ModelState.IsValid)
            {
                var user = new User
                    {
                        FirstName = model.FirstName,
                        LastName = model.LastName,
                        Username = model.UserName,
                        Email = model.Email,
                        Password = model.Password
                    };

                CreateUserStatus createStatus = _userService.CreateUser(user);

                if (createStatus == CreateUserStatus.Success)
                {
                    _authenticationService.SetAuthCookie(model.UserName);
                    return this.RedirectToAction("Welcome", "Account");
                }

                this.ModelState.AddModelError(string.Empty, ErrorCodeToString(createStatus));
            }

            return this.View(model);
        }

        private static string ErrorCodeToString(CreateUserStatus createStatus)
        {
            switch (createStatus)
            {
                case CreateUserStatus.DuplicateUserName:
                    return "User name already exists. Please enter a different user name.";

                case CreateUserStatus.DuplicateEmail:
                    return "A user name for that e-mail address already exists. Please enter a different e-mail address.";
               
                default:
                    return "An unknown error occurred. Please verify your entry and try again. If the problem persists, please contact your system administrator.";
            }
        }
    }
}