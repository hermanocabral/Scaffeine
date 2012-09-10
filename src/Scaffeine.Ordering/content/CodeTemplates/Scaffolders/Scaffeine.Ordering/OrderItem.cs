using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;

namespace MvcApplication98.Core.Model
{
    public class OrderItem : PersistentEntity
    {
        [DataMember]
        [Required]
        public int ProductId { get; set; }

        [ForeignKey("ProductId")]
        [DataMember]
        public Product Product { get; set; }

        [DataMember]
        [Required]
        public int Quantity { get; set; }

        [DataMember]
        [Required]
        public int OrderId { get; set; }

        [ForeignKey("OrderId")]
        public virtual Order Order { get; set; }
    }
}
