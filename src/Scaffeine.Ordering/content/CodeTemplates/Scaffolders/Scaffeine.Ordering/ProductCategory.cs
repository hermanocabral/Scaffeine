using System;
using System.ComponentModel.DataAnnotations;
using System.Runtime.Serialization;

namespace MvcApplication98.Core.Model
{    
    [DataContract]
    [Serializable]
    [DisplayColumn("Name")]
    public class ProductCategory : PersistentEntity
    {
        [DataMember]
        public string Name { get; set; }

        [Required]
        [DataMember]
        public int CategoryId { get; set; }

        [ForeignKey("CategoryId")]
        [DataMember]
        public virtual Category Category { get; set; }

        [Required]
        [DataMember]
        public int ProductId { get; set; }
        
        [ForeignKey("ProductId")]
        [DataMember]
        public virtual Product Product { get; set; }
    }    
}
