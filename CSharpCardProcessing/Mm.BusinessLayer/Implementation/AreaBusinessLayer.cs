
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Mm.DomainModel;
using Mm.DataAccessLayer.Interface;
using Mm.BusinessLayer.Interface;

namespace Mm.BusinessLayer.Implementation
{
    public class AreaBusinessLayer : IAreaBusinessLayer
    {
        private IAreaRepository _repository;
        public IAreaRepository Repository => _repository ?? (_repository = new AreaBusinessLayer());
        public IList<Area> Get()
        {
            return Repository.Get();
        }
    }
}
