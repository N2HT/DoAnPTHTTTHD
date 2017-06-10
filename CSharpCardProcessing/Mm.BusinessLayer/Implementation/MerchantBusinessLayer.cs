using System.Collections.Generic;
using Mm.BusinessLayer.Interface;
using Mm.DataAccessLayer;
using Mm.DomainModel;

namespace Mm.BusinessLayer.Implementation
{
	public class MerchantBusinessLayer : IMerchantBusinessLayer
	{
		private readonly IMerchantRepository _merchantRepository;
		public MerchantBusinessLayer()
		{
			_merchantRepository = new MerchantRepository();
		}

		#region Merchant
		public Merchant GetMerchantById(int id)
		{
			return _merchantRepository.GetSingle(m => m.MerchantId == id);
		}
		public void AddMerchant(params Merchant[] merchants)
		{
			_merchantRepository.Add(merchants);
		}
		public void UpdateMerchant(params Merchant[] merchants)
		{
			_merchantRepository.Update(merchants);
		}

		public void RemoveMerchant(params Merchant[] merchants)
		{
			_merchantRepository.Remove(merchants);
		}

		public void InactivateMerchant(int merchantId)
		{
			var mc = _merchantRepository.GetSingle(m => m.MerchantId == merchantId);
			mc.Activate = false;
			_merchantRepository.Update(mc);
		}
		public void ActivateMerchant(int merchantId)
		{
			var mc = _merchantRepository.GetSingle(m => m.MerchantId == merchantId);
			mc.Activate = true;
			_merchantRepository.Update(mc);
		}
		/// <summary>
		/// Search Merchant Bussiness
		/// </summary>
		/// <param name="name"> Merchant name</param>
		/// <returns> List Merchant</returns>
		public IList<Merchant> SearchMerchant(string name)
		{
			return _merchantRepository.GetList(item => item.MerchantName.Contains(name));
		}
		public IList<Merchant> GetAllMerchant()
		{
			return _merchantRepository.GetAll(m => m.Account, m => m.Area, m => m.MerchantType);
		}
		#endregion
	}
}
