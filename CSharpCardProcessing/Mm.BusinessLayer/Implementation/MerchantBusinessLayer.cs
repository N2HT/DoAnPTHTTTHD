using System.Collections.Generic;
using Mm.BusinessLayer.Interface;
using Mm.DataAccessLayer.Implementation;
using Mm.DataAccessLayer.Interface;
using Mm.DomainModel;

namespace Mm.BusinessLayer.Implementation
{
	public class MerchantBusinessLayer : IMerchantBusinessLayer
	{
		private IMerchantRepository _repository;
        public IMerchantRepository Repository {
            get {
                if (_repository == null)
                    _repository = new MerchantRepository();
                return _repository;
            }
        }

		public Merchant GetMerchantById(int id)
		{
			return Repository.GetSingle(m => m.MerchantId == id, me => me.Agent, mr => mr.Account, mc => mc.Area, mm => mm.MerchantType);
		}
		public Merchant AddMerchant(params Merchant[] merchants)
		{
			var m = Repository.Add(merchants);
			return Repository.GetSingle(x => x.MerchantId == m.MerchantId, me => me.Agent, mr => mr.Account, mc => mc.Area, mm => mm.MerchantType);
		}
		public Merchant UpdateMerchant(params Merchant[] merchants)
		{
			var m = Repository.Update(merchants);
			return Repository.GetSingle(x => x.MerchantId == m.MerchantId, me => me.Agent, mr => mr.Account, mc => mc.Area, mm => mm.MerchantType);
		}

		public void RemoveMerchant(params Merchant[] merchants)
		{
			Repository.Remove(merchants);
		}

		public void InactivateMerchant(int merchantId)
		{
			var mc = Repository.GetSingle(m => m.MerchantId == merchantId);
			mc.Activate = false;
			Repository.Update(mc);
		}
		public void ActivateMerchant(int merchantId)
		{
			var mc = Repository.GetSingle(m => m.MerchantId == merchantId);
			mc.Activate = true;
			Repository.Update(mc);
		}
		/// <summary>
		/// Search Merchant Bussiness
		/// </summary>
		/// <param name="name"> Merchant name</param>
		/// <returns> List Merchant</returns>
		public IList<Merchant> SearchMerchant(string name)
		{
			return Repository.GetList(item => item.MerchantName.Contains(name), me => me.Agent, mr => mr.Account, mc => mc.Area, mm => mm.MerchantType);
		}
		public IList<Merchant> GetAllMerchant()
		{
			return Repository.GetAll(me => me.Agent, mr => mr.Account, mc => mc.Area, mm => mm.MerchantType);
		}

	}
}
