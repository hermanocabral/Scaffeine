namespace $rootnamespace$.Controllers.Account
{
    using System.Web;
    using System.Web.Mvc;
    using Core.Common.Photos;

    public partial class AccountController
    {
        [HttpGet]
        public ActionResult Photo()
        {

            // use this http://blueimp.github.com/jQuery-File-Upload/
            if (!string.IsNullOrWhiteSpace(CurrentUser.PhotoId))
            {
                var photo = PhotoManager.Provider.GetPhotoResize(CurrentUser.PhotoId, "Medium");
                return View(photo);
            }

            return View(new Photo { Url = Url.Content("~/Content/Medium/Male.jpg") });
        }

        [HttpPost]
        public ActionResult Photo(HttpPostedFileBase file)
        {
            var request = new PhotoRequest(file.InputStream, "image/png", null);

            var photo = PhotoManager.Provider.SavePhotoForAllSizes(request, true);

            var user = CurrentUser;
            
            user.PhotoId = photo[0].Id;
            _userService.SaveOrUpdate(user);

            TempData["Success"] = "Profile photo was successfully updated";

            return RedirectToAction("Photo");
        }
    }
}