using Mm.DomainModel;

namespace Mm.BusinessLayer.Interface
{
	public interface IMasterBusinessLayer
	{
		Master GetMasterById(int id);
		void AddMaster(params Master[] masters);
		void UpdateMaster(params Master[] masters);
		void RemoveMaster(params Master[] masters);
	}
}
