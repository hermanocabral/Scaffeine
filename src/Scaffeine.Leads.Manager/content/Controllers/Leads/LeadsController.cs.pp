namespace $rootnamespace$.Controllers.Leads
{
    using System.Web.Mvc;

    public partial class LeadsController : Controller
    {
        public ActionResult Record()
        {
            return this.View();
        }

		public ActionResult Manager()
        {
            return this.View();
        }
    }
}