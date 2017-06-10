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
            this.TransactionDetails = new HashSet<TransactionDetail>();
        }
    
        public int MerchantId { get; set; }
        public string MerchantName { get; set; }
        public string Address { get; set; }
        public Nullable<int> AgentId { get; set; }
        public Nullable<System.DateTime> BeginDay { get; set; }
        public Nullable<bool> Activate { get; set; }
        public Nullable<int> MerchantTypeId { get; set; }
        public Nullable<int> AreaId { get; set; }
        public Nullable<int> AccountId { get; set; }
    
        public virtual Account Account { get; set; }
        public virtual Agent Agent { get; set; }
        public virtual Area Area { get; set; }
        public virtual MerchantType MerchantType { get; set; }
        public virtual ICollection<TransactionDetail> TransactionDetails { get; set; }
    }
}
