namespace $rootnamespace$.Controllers.Account
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Web.Mvc;

    using AutoMapper;
    using Core.Model;
    using Models;

    public partial class AccountController
    {
        [HttpGet]
        public ActionResult Index()
        {
            Mapper.CreateMap<User, ProfileModel>();

            var model = Mapper.Map<User, ProfileModel>(this.CurrentUser);

            return View(model);
        }

        [HttpPost]
        public ActionResult Index(ProfileModel model)
        {
            if (ModelState.IsValid)
            {
                if (string.Compare(CurrentUser.Email, model.Email, StringComparison.InvariantCultureIgnoreCase) != 0)
                {
                    var inUse = _userService.Find(u => u.Email == model.Email).Any();
                    if (inUse)
                    {
                        ModelState.AddModelError("EmailInUse", "Email already in use");
                    }
                }

                if (ModelState.IsValid)
                {
                    CurrentUser.FirstName = model.FirstName;
                    CurrentUser.LastName = model.LastName;
                    CurrentUser.Email = model.Email;

                    try
                    {
                        _userService.SaveOrUpdate(CurrentUser);
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
                _userEmailService.Find(x => x.UserId == CurrentUser.Id).ToList();

            ViewBag.DefaultEmail = CurrentUser.Email;

            return View(model);
        }

        [HttpPost]
        public ActionResult Emails(UserEmail model)
        {
            model.UserId = CurrentUser.Id;
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
