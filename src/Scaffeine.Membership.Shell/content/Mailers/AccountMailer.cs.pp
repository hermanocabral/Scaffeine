namespace $rootnamespace$.Mailers
{
    using Mvc.Mailer;

    public partial class AccountMailers : MailerBase
    {
        public AccountMailers()
        {
            MasterName = "_Layout";
        }       
    }
}