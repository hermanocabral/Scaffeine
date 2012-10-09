[assembly: WebActivator.PreApplicationStartMethod(typeof($rootnamespace$.App_Start.MvcToolsStart), "PreStart")]

namespace $rootnamespace$.App_Start {
	using Core.Infrastructure.Eventing;
    public static class MvcToolsStart {
        public static void PreStart() {
            
        }
    }
}