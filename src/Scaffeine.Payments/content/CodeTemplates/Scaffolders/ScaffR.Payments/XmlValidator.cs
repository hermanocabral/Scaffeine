using System.IO;
using System.Net;
using System.Text;
using System.Xml;
using System.Xml.Schema;

namespace MvcApplication116.Payments
{
    public class XmlValidator
    {
        private string _message = string.Empty;
        private XmlValidationResult _validationResult = XmlValidationResult.NotYetTested;

        public XmlValidationResult IsValid
        {
            get { return _validationResult; }
            private set { _validationResult = value; }
        }

        public string Message
        {
            get { return _message; }
            set { _message = value; }
        }

        public XmlDocument GetXmlDocumentFromUrl(string url)
        {
            var webRequest = (HttpWebRequest) WebRequest.Create(url);

            var webResponse = (HttpWebResponse) webRequest.GetResponse();

            Stream responseStream = webResponse.GetResponseStream();

            string xml_resp;
            using (var reader = new StreamReader(responseStream))
            {
                xml_resp = reader.ReadToEnd();
            }
            var doc = new XmlDocument();
            doc.LoadXml(xml_resp);

            return doc;
        }

        public void Validate(XmlDocument xml, XmlDocument xsd)
        {
            bool contains_errors = false;
            var sb = new StringBuilder();

            ValidationEventHandler validator = delegate(object sender, ValidationEventArgs e)
                                                   {
                                                       sb.Append("Validation Error: " + e.Message + "<br/>");
                                                       contains_errors = true;
                                                   };

            XmlSchema schema = XmlSchema.Read(new StringReader(xsd.OuterXml), validator);

            var doc = new XmlDocument();

            doc.Schemas.Add(schema);

            doc.Validate(validator);

            if (contains_errors)
            {
                _validationResult = XmlValidationResult.Invalid;
            }
            else
            {
                _validationResult = XmlValidationResult.Valid;
            }

            // Assert.IsTrue(contains_errors == false, sb.ToString());
        }
    }
}