namespace $rootnamespace$.Controllers.Account
{
    using System.Web.Mvc;

    using Core.Common.Membership;
    using Core.Model;
    using Models;
	using Mailers;
    using Mvc.Mailer;
    using Omu.ValueInjecter;

    public partial class AccountController
    {
        [AllowAnonymous]
        public ActionResult Register()
        {
            return View();
        }

        [HttpPost, AllowAnonymous]
        public ActionResult Register(RegisterModel model)
        {
            if (ModelState.IsValid)
            {
                var user = new User();

                user.InjectFrom<UnflatLoopValueInjection>(model);
                user.ShowWelcomePage = true;

                CreateUserStatus createStatus = _userService.CreateUser(user);

                if (createStatus == CreateUserStatus.Success)
                {
                    _authenticationService.SetAuthCookie(model.Username, true);

					new Mailer().WelcomeMember(new WelcomeMemberModel { 
                        Name = user.FirstName + " " + user.LastName,
                        Password = user.Password,
                        Username = user.Username,
                        LoginUrl = Url.Action("Logon", "Account"),
                        EmailAddress = user.Email
                    }).Send();

                    return RedirectToAction("Welcome", "Account");
                }

                ModelState.AddModelError(string.Empty, ErrorCodeToString(createStatus));
            }

            return View(model);
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