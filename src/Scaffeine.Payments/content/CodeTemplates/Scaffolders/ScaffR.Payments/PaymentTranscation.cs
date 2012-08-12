using System;

namespace MvcApplication116.Payments
{
    public class AuthCaptureTransaction : IDisposable
    {
        private readonly PreAuthResponse _response;
        private readonly PreAuthRequest _request;

        public AuthCaptureTransaction(PreAuthRequest request)
        {
            _request = request;
            _response = PaymentsManager.PreAuth(request);
        }

        public PreAuthRequest Request
        {
            get { return _request; }
        }

        public PreAuthResponse Response
        {
            get { return _response; }
        }

        public void Dispose()
        {
            var request = new PostAuthRequest
            {
                Amount = _request.Amount
            };

            PaymentsManager.PostAuth(request);
        }
    }
}
