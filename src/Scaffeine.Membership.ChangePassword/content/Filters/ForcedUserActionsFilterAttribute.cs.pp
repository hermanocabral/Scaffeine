using System;
using System.Web.Mvc;
using System.Web.Routing;
using $rootnamespace$.Core.Common.Membership;

namespace $rootnamespace$.Filters
{
    public class ForcedUserActionsFilterAttribute : ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            if (filterContext.HttpContext.Request.IsAuthenticated)
            {
                var user = UserPrincipal.CurrentUser;

                // if password reset is required, redirect to change password page
                if (user.ResetPassword)
                {
                    var actionName = filterContext.ActionDescriptor.ActionName;
                    var controllerName = filterContext.ActionDescriptor.ControllerDescriptor.ControllerName;

                    if (!(controllerName.Equals("Account", StringComparison.InvariantCultureIgnoreCase) && actionName.Equals("ChangePassword", StringComparison.InvariantCultureIgnoreCase)))
                    {
                        filterContext.Result = new RedirectToRouteResult(new RouteValueDictionary
                        {
                            { "controller", "Account" },
                            { "action", "ChangePassword" }                                                 
                        });
                    }
                }
            }
            base.OnActionExecuting(filterContext);
        }
    }
}