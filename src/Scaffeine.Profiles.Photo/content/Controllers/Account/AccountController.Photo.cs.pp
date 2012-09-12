namespace $rootnamespace$.Controllers.Account
{
    using System.Linq;
    using System.Web;
    using System.Web.Mvc;

    using $rootnamespace$.Membership.Helpers;
    using $rootnamespace$.Photos;
    using $rootnamespace$.Photos.Models;

    public partial class AccountController
    {
        [HttpGet]
        public ActionResult Photo()
        {
            // use this http://blueimp.github.com/jQuery-File-Upload/
            if (!string.IsNullOrWhiteSpace(MembershipHelper.CurrentUser.PhotoId))
            {
                var photo = PhotoManager.Provider.GetPhotoResize(MembershipHelper.CurrentUser.PhotoId, "Medium");
                return View(photo);
            }

            return this.View(new Photo()
                {
                    Url = Url.Content("~/Content/Medium/Male.jpg")
                });
        }  

        [HttpPost]
        public ActionResult Photo(HttpPostedFileBase file)
        {
            var request = new PhotoRequest(file.InputStream, "image/png", null);

            var photo = PhotoManager.Provider.SavePhotoForAllSizes(request, true);

            var user = MembershipHelper.CurrentUser;
            
            user.PhotoId = photo[0].Id;
            this._userService.SaveOrUpdate(user);

            TempData["Success"] = "Profile photo was successfully updated";

            return RedirectToAction("Photo");
        }
    }
}