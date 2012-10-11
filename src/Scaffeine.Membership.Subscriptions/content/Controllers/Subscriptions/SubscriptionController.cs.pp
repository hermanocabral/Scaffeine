namespace $rootnamespace$.Controllers.Subscriptions
{
    using Core.Common.Subscriptions;
    using Extensions;
    using Filters;
    using Models;
	using System;
	using System.Web.Mvc;

    public class SubscriptionController : Controller
    {
        [AllowAnonymous, FillDropDowns]
        public ActionResult Create()
        {
            return View(new CreditCardModel());
        }

        [HttpPost, AllowAnonymous, FillDropDowns]
        public ActionResult Create(CreditCardModel model)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    var response = SubscriptionsManager.CreateAccount(new AccountRequest()
                    {
                        AcceptLanguage = "en-US",
                        Accountcode = Guid.NewGuid().ToString().Substring(0, 5),
                        Email = this.GetCurrentUser().Email,
                        FirstName = this.GetCurrentUser().FirstName,
                        LastName = this.GetCurrentUser().LastName,
                        Address1 = this.GetCurrentUser().AddressLine1,
                        Address2 = this.GetCurrentUser().AddressLine2,
                        Username = this.GetCurrentUser().Username,
                        City = this.GetCurrentUser().City,
                        State = this.GetCurrentUser().State,
                        Phone = this.GetCurrentUser().PhoneNumber,
                        ZipCode = this.GetCurrentUser().ZipCode,
                        IPAddress = "1.1.1.1",
                        CardNumber = model.CreditCardNumber,
                        CardType = model.CardType,
                        Month = model.Month,
                        Year = model.Year
                    });
                }
                catch (Exception ex)
                {
                    ModelState.AddModelError("", ex.Message);
                }
  

            }
            return View(model);
        }

    }
}
