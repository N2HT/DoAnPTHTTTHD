using Mm.DataAccessLayer.Interface;
using Mm.DomainModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Mm.DataAccessLayer.Implementation
{
    public class MessageRepository: GenericDataRepository<Message>, IMessageRepository
    {
    }
}
