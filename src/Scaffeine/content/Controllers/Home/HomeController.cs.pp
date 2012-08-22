namespace $rootnamespace$.Controllers.Home
{
    using System.Web.Mvc;

    using Mvc.Mailer;

    using $rootnamespace$.Filters;
    using $rootnamespace$.Mailers;
    using $rootnamespace$.Models;

    public partial class HomeController : Controller
    {
        partial void IndexLoaded();

        [OnlyAnonymous]
        public ActionResult Index()
        {
            IndexLoaded();
            
            return this.View();
        }

        [AllowAnonymous]
        [HttpGet]
        public ActionResult Contact()
        {
            return this.View(new ContactUsModel());
        }

        [AllowAnonymous]
        [HttpPost]
        public ActionResult Contact(ContactUsModel model)
        {
            if (this.ModelState.IsValid)
            {
                new ContactUsMailer().ContactUs(model).Send();
            }

            return this.View(model);
        }
    }
}
