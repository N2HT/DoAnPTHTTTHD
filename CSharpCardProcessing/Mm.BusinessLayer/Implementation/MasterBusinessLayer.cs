using System;
using System.Collections.Generic;
using Mm.BusinessLayer.Interface;
using Mm.DataAccessLayer.Implementation;
using Mm.DataAccessLayer.Interface;
using Mm.DomainModel;

namespace Mm.BusinessLayer.Implementation
{
	public class MasterBusinessLayer : IMasterBusinessLayer
	{
		private IMasterRepository _repository;
        public IMasterRepository Repository {
            get {
                if (_repository == null)
                    _repository = new MasterRepository();
                return _repository;
            }
        }
		public MasterBusinessLayer()
		{
			_repository = new MasterRepository();
		}

		public Master GetMasterById(int id)
		{
			return Repository.GetSingle(d => d.MasterId == id, m => m.Account);
		}

		public Master AddMaster(params Master[] masters)
		{
			var mt = Repository.Add(masters);
			return Repository.GetSingle(d => d.MasterId == mt.MasterId, m => m.Account);
		}

		public Master UpdateMaster(params Master[] masters)
		{
			var mt = Repository.Update(masters);
			return Repository.GetSingle(d => d.MasterId == mt.MasterId, m => m.Account);
		}

		public void RemoveMaster(params Master[] masters)
		{
			Repository.Remove(masters);
		}

        public IList<Master> Get()
        {
            return Repository.GetAll();
        }
    }
}
