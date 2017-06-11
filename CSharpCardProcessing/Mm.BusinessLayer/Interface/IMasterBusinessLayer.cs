using Mm.DomainModel;
using System.Collections.Generic;

namespace Mm.BusinessLayer.Interface
{
	public interface IMasterBusinessLayer
	{
        IList<Master> Get();
        Master GetMasterById(int id);
		void AddMaster(params Master[] masters);
		void UpdateMaster(params Master[] masters);
		void RemoveMaster(params Master[] masters);
	}
}
