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
    
    public partial class Report_Merchant
    {
        public int ReportId { get; set; }
        public Nullable<int> MerchantId { get; set; }
        public Nullable<int> TransactionType { get; set; }
        public string CardType { get; set; }
        public Nullable<decimal> SaleAmount { get; set; }
        public Nullable<decimal> ReturnAmount { get; set; }
        public Nullable<int> SaleCount { get; set; }
        public Nullable<int> ReturnCount { get; set; }
        public Nullable<decimal> NetAmount { get; set; }
        public Nullable<System.DateTime> ReportDate { get; set; }
        public Nullable<System.DateTime> FromDate { get; set; }
        public Nullable<System.DateTime> ToDate { get; set; }
    
        public virtual Report_Agent Report_Agent { get; set; }
        public virtual ReportType ReportType { get; set; }
    }
}
