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
    
    public partial class Message
    {
        public int MessageId { get; set; }
        public Nullable<int> MasterId { get; set; }
        public Nullable<int> AgentId { get; set; }
        public Nullable<int> MerchantId { get; set; }
        public Nullable<int> MessageTypeId { get; set; }
        public string MessageContent { get; set; }
        public Nullable<System.DateTime> Time { get; set; }
    
        public virtual MessageType MessageType { get; set; }
    }
}
