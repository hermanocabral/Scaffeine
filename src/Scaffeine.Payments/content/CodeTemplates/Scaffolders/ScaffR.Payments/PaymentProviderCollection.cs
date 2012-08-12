using System;
using System.Configuration.Provider;

namespace MvcApplication116.Payments
{
    public partial class PaymentProviderCollection : ProviderCollection
    {
        public new PaymentProvider this[string name]
        {
            get { return (PaymentProvider)base[name]; }
        }

        public override void Add(ProviderBase provider)
        {
            if (provider == null)
                throw new ArgumentNullException("provider");

            if (!(provider is PaymentProvider))
                throw new ArgumentException
                    ("Invalid provider type", "provider");

            base.Add(provider);
        }
    }
}
