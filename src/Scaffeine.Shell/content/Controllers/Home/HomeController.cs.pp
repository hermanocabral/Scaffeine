namespace $rootnamespace$.Controllers.Home
{
    using System.Web.Mvc;

    using $rootnamespace$.Filters;

    public partial class HomeController : Controller
    {
        partial void IndexLoaded();

        [$rootnamespace$.Filters.AllowAnonymous]
        public ActionResult Index()
        {
            IndexLoaded();
            
            return this.View();
        }
    }
}
