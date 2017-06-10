using System.Collections.Generic;
using Mm.DomainModel;

namespace Mm.BusinessLayer.Interface
{
	public interface IAgentBusinessLayer
	{
		IList<Agent> GetAllAgent();
		Agent GetAgentById(int id);
		void AddAgent(params Agent[] agents);
		void UpdateAgent(params Agent[] agents);
		void RemoveAgent(params Agent[] agents);
		void ActivateAgent(int id);
		void InactivateAgent(int id);
		IList<Agent> SearchAgent(string name);
	}
}
