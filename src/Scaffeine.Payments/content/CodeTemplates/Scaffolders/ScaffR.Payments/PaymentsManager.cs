using System.Configuration.Provider;
using System.Web.Configuration;

namespace MvcApplication116.Payments
{
    public partial class PaymentsManager
    {
        #region Provider-specific code

        private static readonly object _lock = new object();
        private static PaymentProvider _provider;
        private static PaymentProviderCollection _providers;

        public static PaymentProvider Provider
        {
            get { LoadProviders(); return _provider; }
        }

        public static PaymentProviderCollection Providers
        {
            get { LoadProviders(); return _providers; }
        }

        private static void LoadProviders()
        {
            if (_provider == null)
            {
                lock (_lock)
                {
                    if (_provider == null)
                    {
                        var section = (PaymentsSection)
                                      WebConfigurationManager.GetSection
                                          ("MvcApplication116/MvcApplication116.Payments");

                        _providers = new PaymentProviderCollection();
                        ProvidersHelper.InstantiateProviders
                            (section.Providers, _providers,
                             typeof(PaymentProvider));
                        _provider = _providers[section.DefaultProvider];

                        if (_provider == null)
                            throw new ProviderException
                                ("Unable to load default SubscriptionProvider");
                    }
                }
            }
        }

        #endregion

        public static PreAuthResponse PreAuth(PreAuthRequest request)
        {
            return Provider.PreAuth(request);
        }

        public static PostAuthResponse PostAuth(PostAuthRequest request)
        {
            return Provider.PostAuth(request);
        }
    }
}
