namespace $rootnamespace$.Controllers.Users
{
	using System.Web.Mvc;
    using Core.Interfaces.Service;

    public partial class UserController : Controller
    {
        private readonly IUserService _service;

        public UserController(IUserService service)
        {
            _service = service;
        }
    }
}
