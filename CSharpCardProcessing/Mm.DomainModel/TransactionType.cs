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
    
    public partial class TransactionType
    {
        public TransactionType()
        {
            this.TransactionDetails = new HashSet<TransactionDetail>();
        }
    
        public int TransactionTypeId { get; set; }
        public string TransactionTypeName { get; set; }
    
        public virtual ICollection<TransactionDetail> TransactionDetails { get; set; }
    }
}
