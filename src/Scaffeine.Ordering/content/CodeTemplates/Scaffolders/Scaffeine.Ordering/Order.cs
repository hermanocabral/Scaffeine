using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;

namespace MvcApplication98.Core.Model
{
    public class Order : PersistentEntity
    {
        [DataMember, Required]
        public int UserId { get; set; }

        [DataMember, ForeignKey("UserId")]
        public User User { get; set; }

        [DataMember]
        public virtual ICollection<OrderItem> OrderItems { get; set; } 
    }

}
