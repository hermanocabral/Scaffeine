namespace $rootnamespace$.Controllers.Account
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Web.Mvc;

    using AutoMapper;
    using Core.Model;
    using Extensions;
    using Models;

    public partial class AccountController
    {
        [HttpGet]
        public ActionResult Index()
        {
            Mapper.CreateMap<User, ProfileModel>();

            var model = Mapper.Map<User, ProfileModel>(this.GetCurrentUser());

            return View(model);
        }

        [HttpPost]
        public ActionResult Index(ProfileModel model)
        {
            if (ModelState.IsValid)
            {
                if (string.Compare(this.GetCurrentUser().Email, model.Email, StringComparison.InvariantCultureIgnoreCase) != 0)
                {
                    var inUse = _userService.Find(u => u.Email == model.Email).Any();
                    if (inUse)
                    {
                        ModelState.AddModelError("EmailInUse", "Email already in use");
                    }
                }

                if (ModelState.IsValid)
                {
                    this.GetCurrentUser().FirstName = model.FirstName;
                    this.GetCurrentUser().LastName = model.LastName;
                    this.GetCurrentUser().Email = model.Email;

                    try
                    {
                        _userService.SaveOrUpdate(this.GetCurrentUser());
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
                _userEmailService.Find(x => x.UserId == this.GetCurrentUser().Id).ToList();

            ViewBag.DefaultEmail = this.GetCurrentUser().Email;

            return View(model);
        }

        [HttpPost]
        public ActionResult Emails(UserEmail model)
        {
            model.UserId = this.GetCurrentUser().Id;
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
