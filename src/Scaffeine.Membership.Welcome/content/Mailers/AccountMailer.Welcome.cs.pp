using System;
using System.Net.Mail;
using Mvc.Mailer;
using $rootnamespace$.Models;

namespace $rootnamespace$.Mailers
{
    public partial class AccountMailers
    {
        public virtual MailMessage WelcomeMember(WelcomeMemberModel model)
        {
            var mailMessage = new MailMessage { Subject = "Welcome" };

            mailMessage.To.Add(model.EmailAddress);
            PopulateBody(mailMessage, viewName: "WelcomeMember");

            return mailMessage;
        }
    }
}