using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Mm.DomainModel;
using Mm.DataAccessLayer;
namespace Mm.BusinessLayer
{
    public class BusinessLayer:IBusinessLayer
    {
        private readonly IMasterRepository _masterRepository;
        private readonly IAgentRepository _agentRepository;

        public BusinessLayer()
        {
            _masterRepository = new MasterRepository();
            _agentRepository = new AgentRepository();
        }

        // Agent
        public IList<DomainModel.Agent> GetAllAgent()
        {
            return _agentRepository.GetAll();
        }

        public DomainModel.Agent GetAgentById(int id)
        {
            return _agentRepository.GetSingle(d => d.AgentId==id);
        }

        public void AddAgent(params DomainModel.Agent[] agents)
        {
            _agentRepository.add(agents);
        }

        public void UpdateAgent(params DomainModel.Agent[] agents)
        {
            _agentRepository.update(agents);
        }

        public void RemoveAgent(params DomainModel.Agent[] agents)
        {
            _agentRepository.remove(agents);
        }
        // Master
        public DomainModel.Master GetMasterById(int id)
        {
            return _masterRepository.GetSingle(d => d.MasterId == id);
        }

        public void AddMaster(params DomainModel.Master[] masters)
        {
            _masterRepository.add(masters);
        }

        public void UpdateMaster(params DomainModel.Master[] masters)
        {
            _masterRepository.update(masters);
        }

        public void RemoveMaster(params DomainModel.Master[] masters)
        {
            _masterRepository.remove(masters);
        }
    }
}
