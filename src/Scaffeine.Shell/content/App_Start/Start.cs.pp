using $rootnamespace$.Core.Infrastructure.Eventing;
using $rootnamespace$.Handlers;

[assembly: WebActivator.PreApplicationStartMethod(typeof($rootnamespace$.App_Start.MvcToolsStart), "PreStart")]

namespace $rootnamespace$.App_Start {
    public static class MvcToolsStart {
        public static void PreStart() {
            MessageBus.Instance.Subscribe(NotificationHandler.Instance);
        }
    }
}