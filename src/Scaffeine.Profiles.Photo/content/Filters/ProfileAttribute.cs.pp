namespace $rootnamespace$.Filters
{
    using System.Web.Mvc;

    using Core.Common.Membership;
    using Core.Common.Photos;

    public class ProfileAttribute : ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            if (filterContext.HttpContext.Request.IsAuthenticated)
            {
                var user = UserPrincipal.CurrentUser;
                var viewbag = filterContext.Controller.ViewBag;
                viewbag.Username = user.Username;
                viewbag.FirstName = user.FirstName;
                viewbag.LastName = user.LastName;
                viewbag.SmallProfileUrl = UrlHelper.GenerateContentUrl("~/Content/Small/male.jpg", filterContext.HttpContext);
                viewbag.MediumProfileUrl = UrlHelper.GenerateContentUrl("/Content/Medium/male.jpg", filterContext.HttpContext);
                viewbag.TinyProfileUrl = UrlHelper.GenerateContentUrl("~/Content/Tiny/male.jpg", filterContext.HttpContext);
                if (!string.IsNullOrWhiteSpace(user.PhotoId))
                {
                    // does resize exist?
                    var resizes = PhotoManager.Provider.GetAllPhotoResizes(user.PhotoId);

                    if (resizes.ContainsKey("Small"))
                    {
                        viewbag.SmallProfileUrl = resizes["Small"].Url;
                    }

                    if (resizes.ContainsKey("Medium"))
                    {
                        viewbag.MediumProfileUrl = resizes["Medium"].Url;
                    }

                    if (resizes.ContainsKey("Tiny"))
                    {
                        viewbag.TinyProfileUrl = resizes["Tiny"].Url;
                    }
                }
            }
        }
    }
}