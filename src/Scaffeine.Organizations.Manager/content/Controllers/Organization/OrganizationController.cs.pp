namespace $rootnamespace$.Controllers.Organization
{
    using System.Web.Mvc;

    public class OrganizationController : BaseController
    {
        public ActionResult Index()
        {
            return this.View();
        }
    }
}
