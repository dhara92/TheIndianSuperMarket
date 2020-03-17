using System;
using System.Collections.Generic;

namespace TheIndianSuperMarket.Models
{
    public partial class Customers
    {
        public Customers()
        {
            Purchases = new HashSet<Purchases>();
        }

        public int CustomerId { get; set; }
        public string CustomerName { get; set; }
        public string CustomerPhone { get; set; }
        public string CustomerEmail { get; set; }
        public string Password { get; set; }

        public virtual ICollection<Purchases> Purchases { get; set; }
    }
}
