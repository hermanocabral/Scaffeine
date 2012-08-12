using MvcApplication116.Payments.Web;

namespace MvcApplication116.Payments
{
    public partial class PreAuthResponse : IResponse
    {
        public bool Approved { get; set; }

        public string TransactionResult { get; set; }

        public string ApprovalCode { get; set; }

        public string OrderId { get; set; }

        public string ErrorMessage { get; set; }

        public bool IsValid
        {
            get { throw new System.NotImplementedException(); }
        }

        public string ResponseText
        {
            get { throw new System.NotImplementedException(); }
        }

        public string DisplayText
        {
            get { throw new System.NotImplementedException(); }
        }
    }
}
