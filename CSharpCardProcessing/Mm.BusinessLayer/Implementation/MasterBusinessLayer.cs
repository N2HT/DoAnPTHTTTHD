using Mm.BusinessLayer.Interface;
using Mm.DataAccessLayer;
using Mm.DomainModel;

namespace Mm.BusinessLayer.Implementation
{
	public class MasterBusinessLayer : IMasterBusinessLayer
	{
		private readonly IMasterRepository _masterRepository;
		public MasterBusinessLayer()
		{
			_masterRepository = new MasterRepository();
		}

		#region Master
		public Master GetMasterById(int id)
		{
			return _masterRepository.GetSingle(d => d.MasterId == id);
		}

		public void AddMaster(params Master[] masters)
		{
			_masterRepository.Add(masters);
		}

		public void UpdateMaster(params Master[] masters)
		{
			_masterRepository.Update(masters);
		}

		public void RemoveMaster(params Master[] masters)
		{
			_masterRepository.Remove(masters);
		}
		#endregion
	}
}
