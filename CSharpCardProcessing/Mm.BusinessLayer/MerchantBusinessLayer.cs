using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Mm.DomainModel;
using Mm.DataAccessLayer;

namespace Mm.BusinessLayer
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
        /// <param name="agentName"> Merchant name</param>
        /// <returns> List Merchant</returns>
        public List<Merchant> SearchMerchant(string merchantName)
        {
            return _merchantRepository.GetList(item => item.MerchantName.Contains(merchantName)) as List<Merchant>;
        }
        #endregion
    }
}
