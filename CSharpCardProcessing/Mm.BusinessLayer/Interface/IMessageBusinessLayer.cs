using Mm.DomainModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Mm.BusinessLayer.Implementation.Interface
{
    public interface IMessageBusinessLayer
    {
        Message SendMessage(params Message[] mes);
        List<Message> Get();
        List<Message> GetUnread();
    }
}
