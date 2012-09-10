using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Runtime.Serialization;

namespace MvcApplication98.Core.Model
{
    [DisplayColumn("Name")]
    public class Product : PersistentEntity
    {
        [DataMember, Required]
        public string Name { get; set; }

        [DataMember, Required]
        public double Price { get; set; }

        [DataMember]
        public string ImageUrl { get; set; }

        [DataMember]
        public string Sku { get; set; }

        [DataMember]
        public virtual ICollection<ProductCategory> Categories { get; set; } 
    }
}
