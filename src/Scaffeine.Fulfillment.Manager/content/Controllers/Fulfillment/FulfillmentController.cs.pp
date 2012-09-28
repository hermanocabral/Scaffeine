namespace $rootnamespace$.Controllers.Fulfillment
{
    using System.Web.Mvc;

    public partial class FulfillmentController : BaseController
    {
		public ActionResult Manager()
        {
            return this.View();
        }      
    }
}