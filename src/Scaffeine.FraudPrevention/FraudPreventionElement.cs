using System.Configuration;

namespace iEnvoke.FraudPrevention
{
    public class FraudPreventionSection : ConfigurationSection
    {
        [ConfigurationProperty("fraudThreshold")]
        public FraudThreshold FraudThreshold
        {
            get { return (FraudThreshold)base["fraudThreshold"]; }
            set { base["fraudThreshold"] = value; }
        }

        [StringValidator(MinLength = 1)]
        [ConfigurationProperty("defaultProvider", DefaultValue = "DummyProvider")]
        public string DefaultProvider
        {
            get { return (string)base["defaultProvider"]; }
            set { base["defaultProvider"] = value; }
        }

        [ConfigurationProperty("providers")]
        public ProviderSettingsCollection Providers
        {
            get { return (ProviderSettingsCollection)base["providers"]; }
        }
    }
}
