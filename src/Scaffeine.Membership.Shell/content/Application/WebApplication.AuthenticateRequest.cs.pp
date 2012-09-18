namespace $rootnamespace$.Application
{
    using System;
    using System.Linq;
    using System.Threading;
    using System.Web;
    using System.Web.Security;

    using App_Start;
    using Core.Common.Membership;
    using Core.Interfaces.Service;

    using Ninject;

    public partial class WebApplication
	{
        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {
            string cookieName = FormsAuthentication.FormsCookieName;
            HttpCookie authCookie = Context.Request.Cookies[cookieName];

            if (authCookie == null) return;

            FormsAuthenticationTicket authTicket = FormsAuthentication.Decrypt(authCookie.Value);
            string[] roles = authTicket.UserData.Split(new[] { '|' });

            var userService = NinjectWebCommon.Kernel().Get<IUserService>();

            var user = userService.Find(u => u.Username == authTicket.Name).FirstOrDefault();
            if (user != null)
            {
                var principal = new UserPrincipal(user);
                Context.User = principal;
                Thread.CurrentPrincipal = principal;
            }
        }
	}
}