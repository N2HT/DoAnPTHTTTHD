
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Mm.DomainModel;
using Mm.DataAccessLayer.Interface;
using Mm.BusinessLayer.Interface;
using Mm.DataAccessLayer.Implementation;

namespace Mm.BusinessLayer.Implementation
{
    public class AreaBusinessLayer : IAreaBusinessLayer
    {
        private IAreaReponsitory _repository;
        public IAreaReponsitory Repository
        {
            get
            {
                if (_repository == null)
                    _repository = new AreaReponsitory();
                return _repository;
            }
        }
        public AreaBusinessLayer()
        {
            _repository = new AreaReponsitory();
        }
        public IList<Area> Get()
        {
            return Repository.GetAll();
        }
    }
}
