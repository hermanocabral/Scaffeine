namespace $rootnamespace$.Controllers.Account
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Web.Mvc;

    using AutoMapper;

    using $rootnamespace$.Core.Common.Membership;
    using $rootnamespace$.Core.Model;
    using $rootnamespace$.Models;

    public partial class AccountController
    {
        [HttpGet]
        public ActionResult Index()
        {
            Mapper.CreateMap<User, ProfileModel>();

            var model = Mapper.Map<User, ProfileModel>(UserPrincipal.CurrentUser);

            return View(model);
        }

        [HttpPost]
        public ActionResult Index(ProfileModel model)
        {
            if (ModelState.IsValid)
            {
                var user = UserPrincipal.CurrentUser;

                if (string.Compare(user.Email, model.Email, StringComparison.InvariantCultureIgnoreCase) != 0)
                {
                    var inUse = _userService.Find(u => u.Email == model.Email).Any();
                    if (inUse)
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
                _userEmailService.Find(x => x.UserId == UserPrincipal.CurrentUser.Id).ToList();

            ViewBag.DefaultEmail = UserPrincipal.CurrentUser.Email;

            return View(model);
        }

        [HttpPost]
        public ActionResult Emails(UserEmail model)
        {
            model.UserId = UserPrincipal.CurrentUser.Id;
            if (ModelState.IsValid)
            {
                _userEmailService.SaveOrUpdate(model);
                TempData["Success"] = "Email was successfully added";
            }

            return RedirectToAction("Emails");
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
