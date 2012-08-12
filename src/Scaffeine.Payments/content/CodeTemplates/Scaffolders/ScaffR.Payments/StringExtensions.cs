using System.Linq;

namespace MvcApplication116.Payments
{
    public static class StringExtensions
    {
        public static string StripNonDigits(this string toStrip)
        {
            if (!string.IsNullOrEmpty(toStrip)){
                return toStrip.Where(c => c >= 48 && c <= 57).Aggregate("", (current, c) => current + c);
            }
            return toStrip;
        }
    }
}
