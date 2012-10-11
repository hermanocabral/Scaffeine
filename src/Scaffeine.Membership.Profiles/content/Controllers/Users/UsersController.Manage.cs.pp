using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace $rootnamespace$.Controllers.Users
{
    public partial class UsersController
    {
        public ActionResult Index(int page = 1, int pageSize = 10)
        {
            var model = UserService.Page(page, pageSize);
            return View(model);
        }

    }
}
