using Mm.DomainModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Mm.BusinessLayer
{
    public interface IMasterBusinessLayer
    {
        Master GetMasterById(int id);
        void AddMaster(params Master[] masters);
        void UpdateMaster(params Master[] masters);
        void RemoveMaster(params Master[] masters);
    }
}
