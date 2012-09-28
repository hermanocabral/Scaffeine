namespace $rootnamespace$.Filters.UserContextFilters
{
    using System.Web.Mvc;
    using Controllers;
    using Core.Infrastructure.Pipeline;

    public class SetProfileValues : Filter<ActionExecutingContext>
	{
	    public override bool Process(ref ActionExecutingContext data)
	    {
	        if (data.HttpContext.Request.IsAuthenticated)
            {
                var user = ((BaseController)data.Controller).CurrentUser;

                if (user == null)
                {
                    return false;
                }
                var vb = data.Controller.ViewBag;
                vb.CurrentUser = user;
            }
	        return true;
	    }
	}
}