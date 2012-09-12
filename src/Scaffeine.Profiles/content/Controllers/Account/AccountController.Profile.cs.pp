namespace $rootnamespace$.Controllers.Account
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Web.Mvc;

    using AutoMapper;

    using $rootnamespace$.Core.Model;
    using $rootnamespace$.Filters;
    using $rootnamespace$.Membership.Helpers;
    using $rootnamespace$.Models;

    public partial class AccountController
    {
        [HttpGet]
        public ActionResult Index()
        {
            Mapper.CreateMap<User, ProfileModel>();

            var model = Mapper.Map<User, ProfileModel>(MembershipHelper.CurrentUser);

            return View(model);
        }

        [HttpPost]
        public ActionResult Index(ProfileModel model)
        {
            if (ModelState.IsValid)
            {
                var user = MembershipHelper.CurrentUser;

                if (string.Compare(user.Email, model.Email, StringComparison.InvariantCultureIgnoreCase) != 0)
                {
                    if (MembershipHelper.EmailInUse(model.Email))
                    {
                        ModelState.AddModelError("EmailInUse", "Email already in use");
                    }
                }

                if (ModelState.IsValid)
                {
                    user.FirstName = model.FirstName;
                    user.LastName = model.LastName;
                    user.Email = model.Email;

                    try
                    {
                        _userService.SaveOrUpdate(user);
                        TempData["Success"] = "User was successfully updated.";
                    }
                    catch (Exception)
                    {
                        ModelState.AddModelError("Exception", "Unexpected error");
                    }
                }
            }

            return View(model);
        }


        [HttpGet]
        public ActionResult Emails()
        {
            Mapper.CreateMap<UserEmail, EmailModel>();

            List<UserEmail> model =
                _userEmailService.Find(x => x.UserId == MembershipHelper.CurrentUser.Id).ToList();

            ViewBag.DefaultEmail = MembershipHelper.CurrentUser.Email;

            return View(model);
        }

        [HttpPost]
        public ActionResult Emails(UserEmail model)
        {
            model.UserId = MembershipHelper.CurrentUser.Id;
            if (ModelState.IsValid)
            {
                _userEmailService.SaveOrUpdate(model);
                TempData["Success"] = "Email was successfully added";
            }

            return RedirectToAction("Emails");
        }

        [LoginAuthorize]
        public ActionResult Settings()
        {
            this.ViewBag.PasswordLength = System.Web.Security.Membership.MinRequiredPasswordLength;
            return this.View();
        }

        [LoginAuthorize]
        [HttpPost]
        public ActionResult Settings(ChangePasswordModel model)
        {
            if (this.ModelState.IsValid)
            {
                var status = MembershipHelper.ChangePassword(model.OldPassword, model.NewPassword);

                if (status)
                {
                    TempData["Success"] = "Password was changed successfully";
                }
                else
                {
                    this.ModelState.AddModelError(string.Empty, "The current password is incorrect or the new password is invalid.");
                }                
            }

            // If we got this far, something failed, redisplay form
            this.ViewBag.PasswordLength = System.Web.Security.Membership.MinRequiredPasswordLength;
            return this.View(model);
        }

        [HttpGet]
        public ActionResult Notifications()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Notifications(NotificationsModel model)
        {
            return View();
        }
    }
}
