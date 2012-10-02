namespace $rootnamespace$.Controllers.Users
{
    using Core.Interfaces.Service;

    public partial class UserController : BaseController
    {
        private readonly IUserService _service;

        public UserController(IUserService service)
        {
            _service = service;
        }
    }
}
