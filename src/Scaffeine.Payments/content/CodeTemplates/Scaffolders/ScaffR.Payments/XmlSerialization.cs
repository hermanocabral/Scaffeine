using System.IO;
using System.Text;
using System.Xml;
using System.Xml.Serialization;

namespace MvcApplication116.Payments
{
    public class XmlSerialization<T>
    {
        public virtual string GetXmlString(T request)
        {
            var namespaces = new XmlSerializerNamespaces();
            namespaces.Add("", "");

            return GetXmlString(request, namespaces);
        }

        public virtual string GetXmlString(T request, XmlSerializerNamespaces namespaces)
        {
            var ms = new MemoryStream();

            // create namespaces to remove the garbage
            XmlSerializerNamespaces ns = namespaces;

            var xs = new XmlSerializer(typeof (T));
            var xtw = new XmlTextWriter(ms, Encoding.UTF8);

            xs.Serialize(xtw, request, ns);
            ms = (MemoryStream) xtw.BaseStream;
            return UTF8ByteArrayToString(ms.ToArray());
        }

        protected static string UTF8ByteArrayToString(byte[] characters)
        {
            var encoding = new UTF8Encoding();
            string constructedString = encoding.GetString(characters);
            return constructedString.Trim();
        }
    }
}