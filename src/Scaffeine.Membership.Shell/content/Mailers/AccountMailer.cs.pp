using System;
using System.Net.Mail;
using Mvc.Mailer;
using $rootnamespace$.Models;

namespace $rootnamespace$.Mailers
{
    public partial class AccountMailers : MailerBase
    {
        public AccountMailers()
        {
            MasterName = "_Layout";
        }       
    }
}