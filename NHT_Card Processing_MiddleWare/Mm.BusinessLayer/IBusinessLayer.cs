using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Mm.DataAccessLayer;
using Mm.DomainModel;
namespace Mm.BusinessLayer
{
    public interface IBusinessLayer
    {
        // Agent
        IList<Agent> GetAllAgent();
        Agent GetAgentById(int id);
        void AddAgent(params Agent[] agents);
        void UpdateAgent(params Agent[] agents);
        void RemoveAgent(params Agent[] agents);

        // Master
        Master GetMasterById(int id);
        void AddMaster(params Master[] masters);
        void UpdateMaster(params Master[] masters);
        void RemoveMaster(params Master[] masters);

    }
}
