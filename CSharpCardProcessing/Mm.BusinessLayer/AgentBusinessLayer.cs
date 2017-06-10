using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Mm.DomainModel;
using Mm.DataAccessLayer;

namespace Mm.BusinessLayer
{
    public class AgentBusinessLayer : IAgentBusinessLayer
    {
        private readonly IAgentRepository _agentRepository;

        public AgentBusinessLayer()
        {
            _agentRepository = new AgentRepository();
        }
        #region Agent
        public IList<Agent> GetAllAgent()
        {
            return _agentRepository.GetAll(ac => ac.Account, ar => ar.Area);
        }

        public Agent GetAgentById(int id)
        {
            return _agentRepository.GetSingle(d => d.AgentId == id);
        }

        public void AddAgent(params Agent[] agents)
        {
            _agentRepository.Add(agents);
        }

        public void UpdateAgent(params Agent[] agents)
        {
            _agentRepository.Update(agents);
        }

        public void RemoveAgent(params Agent[] agents)
        {
            _agentRepository.Remove(agents);
        }

        public void InactivateAgent(int agentId)
        {
            var ag = _agentRepository.GetSingle(m => m.AgentId == agentId);
            ag.Activate = false;
            _agentRepository.Update(ag);
        }

        public void ActivateAgent(int agentId)
        {
            var ag = _agentRepository.GetSingle(m => m.AgentId == agentId);
            ag.Activate = true;
            _agentRepository.Update(ag);
        }
        /// <summary>
        /// Search Agent Bussiness
        /// </summary>
        /// <param name="agentName"> Agent name</param>
        /// <returns> List agent</returns>
        public List<Agent> SearchAgent(string agentName)
        {
            return _agentRepository.GetList(item => item.AgentName.Contains(agentName)) as List<Agent>;
        }
        #endregion
    }
}
