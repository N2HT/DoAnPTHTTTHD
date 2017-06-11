using System.Collections.Generic;
using Mm.DomainModel;

namespace Mm.BusinessLayer.Interface
{
    public interface IAgentBusinessLayer
    {
        IList<Agent> GetAllAgent();
        IList<Agent> GetAllAgentWithPaging(int limit, int upset);
        Agent GetAgentById(int id);
        Agent AddAgent(params Agent[] agents);
        Agent UpdateAgent(params Agent[] agents);
        void RemoveAgent(params Agent[] agents);
        void ActivateAgent(int id);
        void InactivateAgent(int id);
        IList<Agent> SearchAgent(string name);
    }
}
