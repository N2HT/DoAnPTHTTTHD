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
    
    public partial class Area
    {
        public Area()
        {
            this.Agents = new HashSet<Agent>();
            this.Merchants = new HashSet<Merchant>();
        }
    
        public int AreaId { get; set; }
        public string AreaName { get; set; }
    
        public virtual ICollection<Agent> Agents { get; set; }
        public virtual ICollection<Merchant> Merchants { get; set; }
    }
}
