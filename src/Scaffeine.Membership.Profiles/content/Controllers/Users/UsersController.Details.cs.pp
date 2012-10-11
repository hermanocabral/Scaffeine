using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace $rootnamespace$.Controllers.Users
{
    using Models.Users;
    using Omu.ValueInjecter;

    public partial class UsersController
    {
        //
        // GET: /UserController.Manage/

        public ActionResult Details(int id)
        {
            var user = UserService.GetById(id);

            var model = new UserViewModel();
            model.InjectFrom<UnflatLoopValueInjection>(user);

            return View(model);
        }

    }
}
