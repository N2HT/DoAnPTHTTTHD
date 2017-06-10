using Mm.DomainModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Mm.BusinessLayer
{
    public interface IMerchantBusinessLayer
    {
        Merchant GetMerchantById(int id);
        void AddMerchant(params Merchant[] masters);
        void UpdateMerchant(params Merchant[] masters);
        void RemoveMerchant(params Merchant[] masters);
    }
}
