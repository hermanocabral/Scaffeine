namespace $rootnamespace$.Controllers.Account
{
    using System.Web.Mvc;

    using $rootnamespace$.Core.Interfaces.Service;

    public partial class AccountController : Controller
    {
        private readonly IUserService _userService;
        private readonly IUserEmailService _userEmailService;
        
        public AccountController(IUserService userService, IUserEmailService userEmailService)
        {
            this._userService = userService;
            this._userEmailService = userEmailService;
        }       
    }
}