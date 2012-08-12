
namespace MvcApplication116.Payments
{
    public partial class PreAuthRequest
    {
        public string CcSecurityCode { get; set; }
        public string PhoneNumber { get; set; }

        public string IPAddress { get; set; }

        public string CcNumber { get; set; }

        public string CcExpMonth { get; set; }

        public string CcExpYear { get; set; }

        public decimal Amount { get; set; }

        public string AddressLine1 { get; set; }

        public string AddressLine2 { get; set; }

        public string Country { get; set; }

        public string City { get; set; }

        public string Email { get; set; }

        public string FirstName { get; set; }

        public string LastName { get; set; }

        public string State { get; set; }

        public string Zip { get; set; }

        public string CustomerId { get; set; }

        public bool EmailCustomer { get; set; }
    }
}
