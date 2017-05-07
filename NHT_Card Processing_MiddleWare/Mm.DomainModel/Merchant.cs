//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Mm.DomainModel
{
    using System;
    using System.Collections.Generic;
    
    public partial class Merchant
    {
        public Merchant()
        {
            this.Transactions = new HashSet<Transaction>();
        }
    
        public int MerchantId { get; set; }
        public string MerchantName { get; set; }
        public string Address { get; set; }
        public Nullable<int> AgentId { get; set; }
        public Nullable<System.DateTime> BeginDay { get; set; }
        public Nullable<bool> Activate { get; set; }
        public Nullable<int> MerchantTypeId { get; set; }
    
        public virtual Agent Agent { get; set; }
        public virtual MerchantType MerchantType { get; set; }
        public virtual ICollection<Transaction> Transactions { get; set; }
    }
}
