using System.Configuration.Provider;

namespace MvcApplication116.Payments
{
    public abstract class PaymentProvider : ProviderBase
    {
        public abstract PreAuthResponse PreAuth(PreAuthRequest request);
        public abstract PostAuthResponse PostAuth(PostAuthRequest request);
    }
}
