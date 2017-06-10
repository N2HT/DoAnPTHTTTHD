using System.Collections.Generic;
using Mm.DomainModel;

namespace Mm.BusinessLayer.Interface
{
	public interface IMerchantBusinessLayer
	{
		IList<Merchant> GetAllMerchant(); 
		Merchant GetMerchantById(int id);
		void AddMerchant(params Merchant[] masters);
		void UpdateMerchant(params Merchant[] masters);
		void RemoveMerchant(params Merchant[] masters);
		void ActivateMerchant(int id);
		void InactivateMerchant(int id);
		IList<Merchant> SearchMerchant(string name);
	}
}
