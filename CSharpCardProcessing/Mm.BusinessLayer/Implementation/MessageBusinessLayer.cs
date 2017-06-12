using Mm.BusinessLayer.Implementation.Interface;
using Mm.DataAccessLayer.Implementation;
using Mm.DataAccessLayer.Interface;
using Mm.DomainModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Mm.BusinessLayer.Implementation
{
    public class MessageBusinessLayer : IMessageBusinessLayer
    {
        private IMessageRepository _repository;
        public IMessageRepository Repository {
            get {
                if (_repository == null)
                    _repository = new MessageRepository();
                return _repository;
            }
        }
        public List<Message> Get()
        {
            return Repository.GetAll().ToList();
        }

        public List<Message> GetUnread() {
            return Repository.GetList(m=>m.MessageType.MessageTypeName=="unread").ToList();
        }
        public Message SendMessage(params Message[] mes)
        {
            return Repository.Add(mes);
        }

    } 
}
