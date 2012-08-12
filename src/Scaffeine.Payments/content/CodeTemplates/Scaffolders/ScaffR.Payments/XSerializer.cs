using System.IO;
using System.Net;
using System.Text;
using System.Xml;
using System.Xml.Serialization;

namespace MvcApplication116.Payments
{
    public class XSerializer<T, U> where T : new() where U : new()
    {
        protected virtual HttpWebRequest GetRequest(string url)
        {
            var webRequest = (HttpWebRequest) WebRequest.Create(url);

            webRequest.Method = "POST";
            webRequest.KeepAlive = true;
            webRequest.ContentType = "text/xml";

            return webRequest;
        }

        public U GetResponseObject(T request, string url)
        {
            HttpWebRequest webRequest = GetRequest(url);

            var xs = new XmlSerializer(typeof (T));
            var ns = new XmlSerializerNamespaces();

            using (var writer = new XmlTextWriter(webRequest.GetRequestStream(), Encoding.UTF8))
            {
                ns.Add("", "");
                xs.Serialize(writer, request, ns);
            }
            ;

            WebResponse webResponse = webRequest.GetResponse();

            var settings = new XmlReaderSettings();
            settings.XmlResolver = null;
            settings.ProhibitDtd = false;

            Stream strm = webResponse.GetResponseStream();

            Encoding encode = Encoding.GetEncoding("utf-8");
            var readStream = new StreamReader(strm, encode);

            string temp = "";
            var sb = new StringBuilder();
            while ((temp = readStream.ReadLine()) != null)
            {
                sb.Append(temp + "\r\n");
            }

            readStream.Close();

            U xmlResponse = default(U);
            var serializer = new XmlSerializer(typeof (U));


            xmlResponse = (U) serializer.Deserialize(new StringReader(sb.ToString()));

            return xmlResponse;
        }
    }
}