﻿namespace $rootnamespace$.Controllers
{
    using System.Web.Mvc;

    public partial class DashboardController : BaseController
    {
        [HttpGet]
        public ActionResult Index()
        {
            // this.PushNotification(new Alert<Department>(department, NotificationType.success, NotificationAction.created));
            return View();
        }
    }
}
