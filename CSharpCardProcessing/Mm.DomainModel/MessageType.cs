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
    
    public partial class MessageType
    {
        public MessageType()
        {
            this.Messages = new HashSet<Message>();
        }
    
        public int MessageTypeId { get; set; }
        public string MessageTypeName { get; set; }
    
        public virtual ICollection<Message> Messages { get; set; }
    }
}
