namespace $rootnamespace$.Controllers.Users
{
    using Core.Interfaces.Service;

    public partial class UserController : BaseController
    {
        private readonly IUserService _service;

        protected UserController(IUserService service)
        {
            _service = service;
        }
    }
}
