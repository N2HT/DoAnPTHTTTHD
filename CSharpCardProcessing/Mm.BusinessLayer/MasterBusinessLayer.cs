using Mm.DataAccessLayer;
using Mm.DomainModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Mm.BusinessLayer
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
