using $rootnamespace$.Core.Model;
using $rootnamespace$.Core.Interfaces.Service;
using System.Web.Mvc;

namespace $rootnamespace$.Controllers
{   
   public partial class RoleController : BaseController<Role>
    {         
        protected IRoleService RoleService;			
				
		public RoleController(IRoleService RoleService)
		{
		    ViewBag.SitemapProvider = "Modules";
            base.Service = this.RoleService = RoleService;	
        }        
    }
}