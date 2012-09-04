namespace $rootnamespace$.Controllers.Inbox
{
    using System.Web.Mvc;

    using $rootnamespace$.Core.Interfaces.Service;
    using $rootnamespace$.Core.Model;

    public partial class InboxController : BaseController<InboxMessage>
    {
        public InboxController(IInboxMessageService service)
        {
            this.Service = service;
        }

        public ActionResult Index()
        {            
            return View();
        }
    }
}
