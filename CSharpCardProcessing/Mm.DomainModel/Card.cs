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
    
    public partial class Card
    {
        public int CardId { get; set; }
        public Nullable<int> MasterId { get; set; }
        public string CardNumber { get; set; }
        public Nullable<int> CardTypeId { get; set; }
    
        public virtual CardType CardType { get; set; }
        public virtual Master Master { get; set; }
    }
}
