namespace $rootnamespace$.Controllers.Community
{
    using System.Web.Mvc;

    public class CommunityController : BaseController
    {
        public ActionResult Index()
        {
            return this.View();
        }
    }
}
