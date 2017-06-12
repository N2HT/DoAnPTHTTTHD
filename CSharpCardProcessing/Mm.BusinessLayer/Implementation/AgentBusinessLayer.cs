using System;
using System.Collections.Generic;
using Mm.BusinessLayer.Interface;
using Mm.DataAccessLayer.Implementation;
using Mm.DataAccessLayer.Interface;
using Mm.DomainModel;

namespace Mm.BusinessLayer.Implementation
{
	public class AgentBusinessLayer : IAgentBusinessLayer
	{
		private IAgentRepository _repository;
        public IAgentRepository Repository {
            get {
                if (_repository == null)
                    _repository = new AgentRepository();
                return _repository;
            }
        }

		public IList<Agent> GetAllAgent()
		{
			return Repository.GetAll(ac => ac.Account, ar => ar.Area, ag => ag.Agent2, at => at.Master);
		}
        public IList<Agent> GetAllAgentWithPaging(int limit, int upset)
        {
            return Repository.GetAllWithPaging(limit, upset, ac => ac.Account, ar => ar.Area, ag => ag.Agent2, at => at.Master);
        }
        public Agent GetAgentById(int id)
		{
			return Repository.GetSingle(d => d.AgentId == id, ac => ac.Account, ac => ac.Account.Privilege, ar => ar.Area, ag => ag.Agent2, at => at.Master);
		}

		public Agent AddAgent(params Agent[] agents)
		{
			var a = Repository.Add(agents);
            return Repository.GetSingle(b => b.AgentId == a.AgentId, ac => ac.Account, ar => ar.Area, ag => ag.Agent2, at => at.Master);
		}

		public Agent UpdateAgent(params Agent[] agents)
		{
			var a = Repository.Update(agents);
			return Repository.GetSingle(b => b.AgentId == a.AgentId, ac => ac.Account, ar => ar.Area, ag => ag.Agent2, at => at.Master);
		}

		public void RemoveAgent(params Agent[] agents)
		{
			Repository.Remove(agents);
		}

		public void InactivateAgent(int agentId)
		{
			var ag = Repository.GetSingle(m => m.AgentId == agentId);
			ag.Activate = false;
			Repository.Update(ag);
		}

		public void ActivateAgent(int agentId)
		{
			var ag = Repository.GetSingle(m => m.AgentId == agentId);
			ag.Activate = true;
			Repository.Update(ag);
		}
		/// <summary>
		/// Search Agent Bussiness
		/// </summary>
		/// <param name="agentName"> Agent name</param>
		/// <returns> List agent</returns>
		public IList<Agent> SearchAgent(string agentName)
		{
			return Repository.GetList(item => item.AgentName.ToLower().Contains(agentName), ac => ac.Account, ar => ar.Area, ag => ag.Agent2, at => at.Master);
		}
    }
}
