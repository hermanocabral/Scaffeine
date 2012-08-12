
namespace MvcApplication116.Payments
{
    public partial class PostAuthResponse
    {
        public string TransactionResult { get; set; }

        public string ApprovalCode { get; set; }

        public string OrderId { get; set; }

        public string ErrorMessage { get; set; }

        public bool Approved { get; set; }
    }
}
