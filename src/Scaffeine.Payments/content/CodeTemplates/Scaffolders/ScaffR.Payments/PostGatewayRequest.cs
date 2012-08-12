using System;
using MvcApplication116.Payments.Web;

namespace MvcApplication116.Payments
{
    public class PostGatewayRequest : HttpProcessRequest, IGatewayRequest
    {
        public override IResponse GetResponse()
        {
            throw new NotImplementedException();
        }
    }
}
