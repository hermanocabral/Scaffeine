using System.Net.Mail;
using $rootnamespace$.Models;

namespace $rootnamespace$.Mailers
{
    public partial class Mailer
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