using System;

namespace MvcApplication116.Payments
{
    public class ResponseEventArgs : EventArgs
    {
        private GatewayResponse _response;
        private string _message;

        public ResponseEventArgs(GatewayResponse response, string message)
        {
            _response = response;
            _message = message;
        }

        public GatewayResponse Response
        {
            get { return _response; }
        }

        public string Message
        {
            get { return _message; }
        }
    }
}