namespace $rootnamespace$.Controllers.Account
{
    using Core.Interfaces.Service;

    public partial class AccountController : BaseController
    {
        private readonly IUserService _userService;
        private readonly IUserEmailService _userEmailService;

        private readonly IAuthenticationService _authenticationService;
        
        public AccountController(IUserService userService, IUserEmailService userEmailService, IAuthenticationService authenticationService)
        {
            _userService = userService;
            _userEmailService = userEmailService;
            _authenticationService = authenticationService;
        }       
    }
}