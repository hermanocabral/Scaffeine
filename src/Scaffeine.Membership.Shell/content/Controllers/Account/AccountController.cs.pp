﻿namespace $rootnamespace$.Controllers.Account
{
    using System.Web.Mvc;

    using $rootnamespace$.Core.Interfaces.Service;

    public partial class AccountController : Controller
    {
        private readonly IUserService _userService;
        private readonly IUserEmailService _userEmailService;

        private readonly IAuthenticationService _authenticationService;
        
        public AccountController(IUserService userService, IUserEmailService userEmailService, IAuthenticationService authenticationService)
        {
            this._userService = userService;
            this._userEmailService = userEmailService;
            this._authenticationService = authenticationService;
        }       
    }
}