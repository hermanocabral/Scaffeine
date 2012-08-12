using MvcApplication116.Payments.Web;

namespace MvcApplication116.Payments
{
    public interface IGatewayResponse : IResponse
    {
        GatewayResponseCode GatewayResponseCode { get; }
    }
}
