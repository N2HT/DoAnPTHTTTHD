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
    
    public partial class Master
    {
        public Master()
        {
            this.AccountStatements = new HashSet<AccountStatement>();
            this.Agents = new HashSet<Agent>();
            this.Cards = new HashSet<Card>();
        }
    
        public int MasterId { get; set; }
        public string MasterName { get; set; }
    
        public virtual ICollection<AccountStatement> AccountStatements { get; set; }
        public virtual ICollection<Agent> Agents { get; set; }
        public virtual ICollection<Card> Cards { get; set; }
    }
}
