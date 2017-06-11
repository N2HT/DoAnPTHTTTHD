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
		public IMasterRepository Repository => _repository ?? (_repository = new MasterRepository());
		public MasterBusinessLayer()
		{
			_repository = new MasterRepository();
		}

		#region Master
		public Master GetMasterById(int id)
		{
			return Repository.GetSingle(d => d.MasterId == id, m => m.Account);
		}

		public void AddMaster(params Master[] masters)
		{
			Repository.Add(masters);
		}

		public void UpdateMaster(params Master[] masters)
		{
			Repository.Update(masters);
		}

		public void RemoveMaster(params Master[] masters)
		{
			Repository.Remove(masters);
		}

        public IList<Master> Get()
        {
            return Repository.GetAll();
        }
        #endregion
    }
}
